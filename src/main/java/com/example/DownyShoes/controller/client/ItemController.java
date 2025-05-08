package com.example.DownyShoes.controller.client;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.DownyShoes.domain.Cart;
import com.example.DownyShoes.domain.Product;
import com.example.DownyShoes.domain.Product_;
import com.example.DownyShoes.domain.User;
import com.example.DownyShoes.domain.dto.ProductCriteriaDTO;
import com.example.DownyShoes.domain.CartDetail;
import com.example.DownyShoes.service.ProductService;
import com.example.DownyShoes.service.VNPayService;
import com.example.DownyShoes.domain.Comment;
import com.example.DownyShoes.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ItemController {

    private final ProductService productService;
    private final VNPayService vnpayService;
    private final UserService userService;

    public ItemController(ProductService productService, VNPayService vnpayService, UserService userService) {
        this.productService = productService;
        this.vnpayService = vnpayService;
        this.userService = userService;
    }

    @GetMapping("/product/{id}")
    public String getProductPage(Model model, @PathVariable long id) {
        Product product = productService.fetchProductById(id).get();
        List<Comment> comments = this.productService.fetchCommentsByProductId(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        model.addAttribute("comments", comments);
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, productId, session, 1);
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);
        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        double total = 0;
        for (CartDetail cartDetail : cartDetails) {
            total += cartDetail.getPrice() * cartDetail.getQuantity();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("total", total);
        model.addAttribute("cart", cart);
        return "client/cart/show";
    }

    @GetMapping("/checkout")
    public String getCheckoutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);
        Cart cart = this.productService.fetchByUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        double total = 0;
        for (CartDetail cartDetail : cartDetails) {
            total += cartDetail.getPrice() * cartDetail.getQuantity();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("total", total);
        return "client/cart/checkout";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleRemoveCartDetail(cartDetailId, session);
        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(HttpServletRequest request, @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverPhone") String receiverPhone,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("paymentMethod") String paymentMethod,
            @RequestParam("total") String total) throws UnsupportedEncodingException {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        String uuid = UUID.randomUUID().toString().replace("-", "");

        this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverPhone, receiverAddress,
                paymentMethod, uuid);

        if (!paymentMethod.equals("COD")) {
            String ip = VNPayService.getIpAddress(request);
            String vnpUrl = this.vnpayService.generateVNPayUrl(Double.parseDouble(total), uuid, ip);

            return "redirect:" + vnpUrl;
        }

        return "client/cart/thank";
    }

    @GetMapping("/thank")
    public String getThankPage(Model model, @RequestParam("vnp_ResponseCode") Optional<String> vnpResponseCode,
            @RequestParam("vnp_TxnRef") Optional<String> paymentRef) {

        if (vnpResponseCode.isPresent() && paymentRef.isPresent()) {
            String paymentStatus = vnpResponseCode.get().equals("00") ? "PAYMENT_SUCCESS" : "PAYMENT_FAILED";
            this.productService.handleUpdatePaymentStatus(paymentRef.get(), paymentStatus);
            if (paymentStatus.equals("PAYMENT_FAILED")) {
                return "redirect:/";
            }
            return "client/cart/thank";
        }
        return "redirect:/";
    }

    @PostMapping("/add-product-from-view-detail")
    public String handleAddProductFromViewDetail(@RequestParam("quantity") long quantity,
            @RequestParam("id") long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session, quantity);
        return "redirect:/product/" + id;
    }

    @GetMapping("/product")
    public String getProductPage(Model model, ProductCriteriaDTO productCriteriaDTO, HttpServletRequest request) {
        int page = 1;
        try {
            if (productCriteriaDTO.getPage().isPresent()) {
                // convert from String to int
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
            } else {
                // page = 1
            }
        } catch (Exception e) {
            // page = 1
            // TODO: handle exception
        }
        // check sort price
        Pageable pageable = PageRequest.of(page - 1, 6);
        if (productCriteriaDTO.getSort() != null && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, 6, Sort.by(Product_.PRICE).ascending());

            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, 6, Sort.by(Product_.PRICE).descending());

            }
        }
        Page<Product> prs = this.productService.fetchProductsWithSpec(pageable, productCriteriaDTO);
        List<Product> products = prs.getContent().size() > 0 ? prs.getContent() : new ArrayList<Product>();
        ;

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            qs = qs.replace("page=" + page, "");
        }

        model.addAttribute("products", products);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", prs.getTotalPages());
        model.addAttribute("queryString", qs);
        return "client/product/show";
    }

    @PostMapping("/comment/{id}")
    public String handleComment(@PathVariable long id, HttpServletRequest request,
            @RequestParam("content") String content) {
        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");
        User user = this.userService.getUserByEmail(email);

        // lưu comment vào database cùng với userid và productid
        if (this.productService.hasUserOrderedProduct(user, id)) {
            Comment comment = new Comment();
            comment.setUser(user);
            Product product = this.productService.fetchProductById(productId).get();
            comment.setProduct(product);
            comment.setContent(content);
            this.productService.handleAddComment(comment);
        } else {
            // alert không được để lại bình luận khi chưa mua hàng
            return "client/product/notcomment";
        }
        return "redirect:/product/" + id;

    }
}
