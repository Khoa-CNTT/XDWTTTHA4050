
$(document).ready(function () {
  "use strict";

  var window_width = $(window).width(),
    window_height = window.innerHeight,
    header_height = $(".default-header").height(),
    header_height_static = $(".site-header.static").outerHeight(),
    fitscreen = window_height - header_height;


  $(".fullscreen").css("height", window_height)
  $(".fitscreen").css("height", fitscreen);

  //------- Active Nice Select --------//

  $('select').niceSelect();


  $('.navbar-nav li.dropdown').hover(function () {
    $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
  }, function () {
    $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
  });

  $('.img-pop-up').magnificPopup({
    type: 'image',
    gallery: {
      enabled: true
    }
  });

  // Search Toggle
  $("#search_input_box").hide();
  $("#search").on("click", function () {
    $("#search_input_box").slideToggle();
    $("#search_input").focus();
  });
  $("#close_search").on("click", function () {
    $('#search_input_box').slideUp(500);
  });

  /*==========================
  javaScript for sticky header
  ============================*/
  $(".sticky-header").sticky();

  /*=================================
  Javascript for banner area carousel
  ==================================*/
  $(".active-banner-slider").owlCarousel({
    items: 1,
    autoplay: false,
    autoplayTimeout: 5000,
    loop: true,
    nav: true,
    navText: ["<img src='/client/img/banner/prev.png'>", "<img src='/client/img/banner/next.png'>"],
    dots: false
  });

  /*=================================
  Javascript for product area carousel
  ==================================*/
  $(".active-product-area").owlCarousel({
    items: 1,
    autoplay: false,
    autoplayTimeout: 5000,
    loop: true,
    nav: true,
    navText: ["<img src='/client/img/product/prev.png'>", "<img src='/client/img/product/next.png'>"],
    dots: false
  });

  /*=================================
  Javascript for single product area carousel
  ==================================*/
  $(".s_Product_carousel").owlCarousel({
    items: 1,
    autoplay: false,
    autoplayTimeout: 5000,
    loop: true,
    nav: false,
    dots: true
  });

  /*=================================
  Javascript for exclusive area carousel
  ==================================*/
  $(".active-exclusive-product-slider").owlCarousel({
    items: 1,
    autoplay: false,
    autoplayTimeout: 5000,
    loop: true,
    nav: true,
    navText: ["<img src='/client/img/product/prev.png'>", "<img src='/client/img/product/next.png'>"],
    dots: false
  });

  //--------- Accordion Icon Change ---------//

  $('.collapse').on('shown.bs.collapse', function () {
    $(this).parent().find(".lnr-arrow-right").removeClass("lnr-arrow-right").addClass("lnr-arrow-left");
  }).on('hidden.bs.collapse', function () {
    $(this).parent().find(".lnr-arrow-left").removeClass("lnr-arrow-left").addClass("lnr-arrow-right");
  });

  // Select all links with hashes
  $('.main-menubar a[href*="#"]')
    // Remove links that don't actually link to anything
    .not('[href="#"]')
    .not('[href="#0"]')
    .click(function (event) {
      // On-page links
      if (
        location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
        &&
        location.hostname == this.hostname
      ) {
        // Figure out element to scroll to
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
        // Does a scroll target exist?
        if (target.length) {
          // Only prevent default if animation is actually gonna happen
          event.preventDefault();
          $('html, body').animate({
            scrollTop: target.offset().top - 70
          }, 1000, function () {
            // Callback after animation
            // Must change focus!
            var $target = $(target);
            $target.focus();
            if ($target.is(":focus")) { // Checking if the target was focused
              return false;
            } else {
              $target.attr('tabindex', '-1'); // Adding tabindex for elements not focusable
              $target.focus(); // Set focus again
            };
          });
        }
      }
    });



  // -------   Mail Send ajax

  $(document).ready(function () {
    var form = $('#booking'); // contact form
    var submit = $('.submit-btn'); // submit button
    var alert = $('.alert-msg'); // alert div for show alert message

    // form submit event
    form.on('submit', function (e) {
      e.preventDefault(); // prevent default form submit

      $.ajax({
        url: 'booking.php', // form action url
        type: 'POST', // form submit method get/post
        dataType: 'html', // request type html/json/xml
        data: form.serialize(), // serialize form data
        beforeSend: function () {
          alert.fadeOut();
          submit.html('Sending....'); // change submit button text
        },
        success: function (data) {
          alert.html(data).fadeIn(); // fade in response data
          form.trigger('reset'); // reset form
          submit.attr("style", "display: none !important");; // reset submit button text
        },
        error: function (e) {
          console.log(e)
        }
      });
    });
  });




  $(document).ready(function () {
    $('#mc_embed_signup').find('form').ajaxChimp();
  });



  if (document.getElementById("js-countdown")) {

    var countdown = new Date("October 17, 2018");

    function getRemainingTime(endtime) {
      var milliseconds = Date.parse(endtime) - Date.parse(new Date());
      var seconds = Math.floor(milliseconds / 1000 % 60);
      var minutes = Math.floor(milliseconds / 1000 / 60 % 60);
      var hours = Math.floor(milliseconds / (1000 * 60 * 60) % 24);
      var days = Math.floor(milliseconds / (1000 * 60 * 60 * 24));

      return {
        'total': milliseconds,
        'seconds': seconds,
        'minutes': minutes,
        'hours': hours,
        'days': days
      };
    }

    function initClock(id, endtime) {
      var counter = document.getElementById(id);
      var daysItem = counter.querySelector('.js-countdown-days');
      var hoursItem = counter.querySelector('.js-countdown-hours');
      var minutesItem = counter.querySelector('.js-countdown-minutes');
      var secondsItem = counter.querySelector('.js-countdown-seconds');

      function updateClock() {
        var time = getRemainingTime(endtime);

        daysItem.innerHTML = time.days;
        hoursItem.innerHTML = ('0' + time.hours).slice(-2);
        minutesItem.innerHTML = ('0' + time.minutes).slice(-2);
        secondsItem.innerHTML = ('0' + time.seconds).slice(-2);

        if (time.total <= 0) {
          clearInterval(timeinterval);
        }
      }

      updateClock();
      var timeinterval = setInterval(updateClock, 1000);
    }

    initClock('js-countdown', countdown);

  };



  $('.quick-view-carousel-details').owlCarousel({
    loop: true,
    dots: true,
    items: 1,
  })



  //----- Active No ui slider --------//



  $(function () {

    if (document.getElementById("price-range")) {

      var nonLinearSlider = document.getElementById('price-range');

      noUiSlider.create(nonLinearSlider, {
        connect: true,
        behaviour: 'tap',
        start: [500, 4000],
        range: {
          // Starting at 500, step the value by 500,
          // until 4000 is reached. From there, step by 1000.
          'min': [0],
          '10%': [500, 500],
          '50%': [4000, 1000],
          'max': [10000]
        }
      });


      var nodes = [
        document.getElementById('lower-value'), // 0
        document.getElementById('upper-value')  // 1
      ];

      // Display the slider value and how far the handle moved
      // from the left edge of the slider.
      nonLinearSlider.noUiSlider.on('update', function (values, handle, unencoded, isTap, positions) {
        nodes[handle].innerHTML = values[handle];
      });

    }

  });


  //-------- Have Cupon Button Text Toggle Change -------//

  $('.have-btn').on('click', function (e) {
    e.preventDefault();
    $('.have-btn span').text(function (i, text) {
      return text === "Have a Coupon?" ? "Close Coupon" : "Have a Coupon?";
    })
    $('.cupon-code').fadeToggle("slow");
  });

  $('.load-more-btn').on('click', function (e) {
    e.preventDefault();
    $('.load-product').fadeIn('slow');
    $(this).fadeOut();
  });





  //------- Start Quantity Increase & Decrease Value --------//




  var value,
    quantity = document.getElementsByClassName('quantity-container');

  function createBindings(quantityContainer) {
    var quantityAmount = quantityContainer.getElementsByClassName('quantity-amount')[0];
    var increase = quantityContainer.getElementsByClassName('increase')[0];
    var decrease = quantityContainer.getElementsByClassName('decrease')[0];
    increase.addEventListener('click', function () { increaseValue(quantityAmount); });
    decrease.addEventListener('click', function () { decreaseValue(quantityAmount); });
  }

  $(document).ready(function () {
    $('.product_count button').on('click', function () {
      let change = 0;
      var button = $(this);
      var oldValue = button.parent().find('.qty').val();
      var newVal;

      if (button.hasClass('increase')) {
        newVal = parseFloat(oldValue) + 1;
        change = 1;
      } else {
        if (oldValue > 1) {
          newVal = parseFloat(oldValue) - 1;
          change = -1;
        } else {
          newVal = 1;
        }
      }

      const input = button.parent().find('.qty');
      input.val(newVal);

      //set form index
      const index = input.attr('data-cart-detail-index');
      const el = document.getElementById(`cartDetails${index}.quantity`);
      $(el).val(newVal);

      // Get price
      const price = input.attr('data-price');
      const id = input.attr('data-id');
      const priceElement = $(`h5[data-id="${id}"]`);
      if (priceElement) {
        const newPrice = +price * newVal;
        priceElement.text(formatCurrency(newPrice.toFixed(2)));
      }
      // Update total
      const totalPriceElement = $(`h5[data-price]`);
      if (totalPriceElement.length) {
        let newTotal = 0;

        // Calculate new total by iterating over each item
        $('.product_count .qty').each(function () {
          const itemPrice = $(this).attr('data-price');
          const itemQuantity = $(this).val();
          newTotal += itemPrice * itemQuantity;
        });

        // Update total price element
        totalPriceElement.each(function (index, element) {
          $(element).text(formatCurrency(newTotal.toFixed(2)));
        });
      }
    });

    function formatCurrency(value) {
      const formatter = new Intl.NumberFormat('vi-VN', {
        style: 'decimal',
        minimumFractionDigits: 0,
      });
      let formatted = formatter.format(value);
      formatted = formatted.replace(/\./g, ',');
      return formatted;
    }
  });

  $('#btnFilter').click(function (event) {
    event.preventDefault();

    let factoryArr = [];
    let sizeArr = [];
    let targetArr = [];

    $('#factoryFilter .pixel-radio:checked').each(function () {
      factoryArr.push($(this).val());
    });

    $('#sizeFilter .pixel-radio:checked').each(function () {
      sizeArr.push($(this).val());
    });

    $('#targetFilter .pixel-radio:checked').each(function () {
      targetArr.push($(this).val());
    });

    let sortValue = $('input[name="price"]:checked').val();

    const currentUrl = new URL(window.location.href);
    const searchParams = currentUrl.searchParams;

    // Add or update query parameters
    searchParams.set('page', '1');
    searchParams.set('sort', sortValue);

    //reset
    searchParams.delete('factory');
    searchParams.delete('target');
    searchParams.delete('size');

    if (factoryArr.length > 0) {
      searchParams.set('factory', factoryArr.join(','));
    }
    if (targetArr.length > 0) {
      searchParams.set('target', targetArr.join(','));
    }
    if (sizeArr.length > 0) {
      searchParams.set('size', sizeArr.join(','));
    }

    // Update the URL and reload the page
    window.location.href = currentUrl.toString();
  });

  //handle auto checkbox after page loading
  // Parse the URL parameters
  const params = new URLSearchParams(window.location.search);

  // Set checkboxes for 'factory'
  if (params.has('factory')) {
    const factories = params.get('factory').split(',');
    factories.forEach(factory => {
      $(`#factoryFilter .pixel-radio[value="${factory}"]`).prop('checked', true);
    });
  }

  // Set checkboxes for 'size'
  if (params.has('size')) {
    const sizes = params.get('size').split(',');
    sizes.forEach(size => {
      $(`#sizeFilter .pixel-radio[value="${size}"]`).prop('checked', true);
    });
  }

  // Set checkboxes for 'target'
  if (params.has('target')) {
    const targets = params.get('target').split(',');
    targets.forEach(target => {
      $(`#targetFilter .pixel-radio[value="${target}"]`).prop('checked', true);
    });
  }

  // Set radio button for 'sort'
  if (params.has('sort')) {
    const sort = params.get('sort');
    $(`input[name="price"][value="${sort}"]`).prop('checked', true);
  }


  //handle add to cart with ajax
  $('.btnAddToCartHomepage').click(function (event) {
    event.preventDefault();

    if (!isLogin()) {
      $.toast({
        heading: 'Lỗi thao tác',
        text: 'Bạn cần đăng nhập tài khoản',
        position: 'top-right',
        icon: 'error'
      })
      return;
    }

    const productId = $(this).attr('data-product-id');
    const token = $("meta[name='_csrf']").attr("content");
    const header = $("meta[name='_csrf_header']").attr("content");

    $.ajax({
      url: `${window.location.origin}/api/add-product-to-cart`,
      beforeSend: function (xhr) {
        xhr.setRequestHeader(header, token);
      },
      type: "POST",
      data: JSON.stringify({ quantity: 1, productId: productId }),
      contentType: "application/json",

      success: function (response) {
        const sum = +response;
        //update cart
        $("#sumCart").text(sum)
        //show message
        $.toast({
          heading: 'Giỏ hàng',
          text: 'Thêm sản phẩm vào giỏ hàng thành công',
          position: 'top-right',

        })

      },
      error: function (response) {
        alert("có lỗi xảy ra, check code đi ba :v")
        console.log("error: ", response);
      }

    });
  });

  $('.btnAddToCartDetail').click(function (event) {
    event.preventDefault();
    if (!isLogin()) {
      $.toast({
        heading: 'Lỗi thao tác',
        text: 'Bạn cần đăng nhập tài khoản',
        position: 'top-right',
        icon: 'error'
      })
      return;
    }

    const productId = $(this).attr('data-product-id');
    const token = $("meta[name='_csrf']").attr("content");
    const header = $("meta[name='_csrf_header']").attr("content");
    const quantity = $("#cartDetails0\\.quantity").val();
    $.ajax({
      url: `${window.location.origin}/api/add-product-to-cart`,
      beforeSend: function (xhr) {
        xhr.setRequestHeader(header, token);
      },
      type: "POST",
      data: JSON.stringify({ quantity: quantity, productId: productId }),
      contentType: "application/json",

      success: function (response) {
        const sum = +response;
        //update cart
        $("#sumCart").text(sum)
        //show message
        $.toast({
          heading: 'Giỏ hàng',
          text: 'Thêm sản phẩm vào giỏ hàng thành công',
          position: 'top-right',

        })

      },
      error: function (response) {
        alert("có lỗi xảy ra, check code đi ba :v")
        console.log("error: ", response);
      }

    });
  });

  function isLogin() {
    const navElement = $("#navbarCollapse");
    const childLogin = navElement.find('a.a-login');
    if (childLogin.length > 0) {
      return false;
    }
    return true;
  }

  function init() {
    for (var i = 0; i < quantity.length; i++) {
      createBindings(quantity[i]);
    }
  };

  function increaseValue(quantityAmount) {
    value = parseInt(quantityAmount.value, 10);

    console.log(quantityAmount, quantityAmount.value);

    value = isNaN(value) ? 0 : value;
    value++;
    quantityAmount.value = value;
  }

  function decreaseValue(quantityAmount) {
    value = parseInt(quantityAmount.value, 10);

    value = isNaN(value) ? 0 : value;
    if (value > 0) value--;

    quantityAmount.value = value;
  }

  init();

  //------- End Quantity Increase & Decrease Value --------//

  /*----------------------------------------------------*/
  /*  Google map js
    /*----------------------------------------------------*/

  if ($("#mapBox").length) {
    var $lat = $("#mapBox").data("lat");
    var $lon = $("#mapBox").data("lon");
    var $zoom = $("#mapBox").data("zoom");
    var $marker = $("#mapBox").data("marker");
    var $info = $("#mapBox").data("info");
    var $markerLat = $("#mapBox").data("mlat");
    var $markerLon = $("#mapBox").data("mlon");
    var map = new GMaps({
      el: "#mapBox",
      lat: $lat,
      lng: $lon,
      scrollwheel: false,
      scaleControl: true,
      streetViewControl: false,
      panControl: true,
      disableDoubleClickZoom: true,
      mapTypeControl: false,
      zoom: $zoom,
      styles: [
        {
          featureType: "water",
          elementType: "geometry.fill",
          stylers: [
            {
              color: "#dcdfe6"
            }
          ]
        },
        {
          featureType: "transit",
          stylers: [
            {
              color: "#808080"
            },
            {
              visibility: "off"
            }
          ]
        },
        {
          featureType: "road.highway",
          elementType: "geometry.stroke",
          stylers: [
            {
              visibility: "on"
            },
            {
              color: "#dcdfe6"
            }
          ]
        },
        {
          featureType: "road.highway",
          elementType: "geometry.fill",
          stylers: [
            {
              color: "#ffffff"
            }
          ]
        },
        {
          featureType: "road.local",
          elementType: "geometry.fill",
          stylers: [
            {
              visibility: "on"
            },
            {
              color: "#ffffff"
            },
            {
              weight: 1.8
            }
          ]
        },
        {
          featureType: "road.local",
          elementType: "geometry.stroke",
          stylers: [
            {
              color: "#d7d7d7"
            }
          ]
        },
        {
          featureType: "poi",
          elementType: "geometry.fill",
          stylers: [
            {
              visibility: "on"
            },
            {
              color: "#ebebeb"
            }
          ]
        },
        {
          featureType: "administrative",
          elementType: "geometry",
          stylers: [
            {
              color: "#a7a7a7"
            }
          ]
        },
        {
          featureType: "road.arterial",
          elementType: "geometry.fill",
          stylers: [
            {
              color: "#ffffff"
            }
          ]
        },
        {
          featureType: "road.arterial",
          elementType: "geometry.fill",
          stylers: [
            {
              color: "#ffffff"
            }
          ]
        },
        {
          featureType: "landscape",
          elementType: "geometry.fill",
          stylers: [
            {
              visibility: "on"
            },
            {
              color: "#efefef"
            }
          ]
        },
        {
          featureType: "road",
          elementType: "labels.text.fill",
          stylers: [
            {
              color: "#696969"
            }
          ]
        },
        {
          featureType: "administrative",
          elementType: "labels.text.fill",
          stylers: [
            {
              visibility: "on"
            },
            {
              color: "#737373"
            }
          ]
        },
        {
          featureType: "poi",
          elementType: "labels.icon",
          stylers: [
            {
              visibility: "off"
            }
          ]
        },
        {
          featureType: "poi",
          elementType: "labels",
          stylers: [
            {
              visibility: "off"
            }
          ]
        },
        {
          featureType: "road.arterial",
          elementType: "geometry.stroke",
          stylers: [
            {
              color: "#d6d6d6"
            }
          ]
        },
        {
          featureType: "road",
          elementType: "labels.icon",
          stylers: [
            {
              visibility: "off"
            }
          ]
        },
        {},
        {
          featureType: "poi",
          elementType: "geometry.fill",
          stylers: [
            {
              color: "#dadada"
            }
          ]
        }
      ]
    });
  }




});


// Try-On Modal Functions
let modelFile = null;
let modelPreview = null;
let dressSource = "upload";
let dressFile = null;
let dressPreview = null;
let pantsFile = null;
let pantsPreview = null;
let selectedProduct = null;
let generatedImage = null;
let isLoading = false;
let taskId = null;

const BASE_URL = window.location.origin;
const NGROK_URL = "https://distinct-spider-cheaply.ngrok-free.app";
const LOCALHOST_URL = "http://localhost:8080";
const IMAGE_PATH = "resources/images/product/";

function openTryOnModal() {
  document.getElementById('tryOnOverlay').style.display = 'flex';
  resetForm();
  loadAllProducts();
}

function closeTryOnModal() {
  document.getElementById('tryOnOverlay').style.display = 'none';
  resetForm();
}

function resetForm() {
  modelFile = null;
  modelPreview = null;
  dressFile = null;
  dressPreview = null;
  pantsFile = null;
  pantsPreview = null;
  selectedProduct = null;
  generatedImage = null;
  taskId = null;
  isLoading = false;

  document.getElementById('modelPreviewWrapper').innerHTML = `
        <div class="uploadPlus">+</div>
        <div>Click to upload model image</div>
    `;
  document.getElementById('dressPreviewWrapper').innerHTML = `
        <div class="uploadPlus">+</div>
        <div>Click to upload dress image</div>
    `;
  document.getElementById('pantsPreviewWrapper').innerHTML = `
        <div class="uploadPlus">+</div>
        <div>Click to upload pants image (optional)</div>
    `;
  document.getElementById('selectedProductPreview').style.display = 'none';
  document.getElementById('selectedProductPreview').innerHTML = '';
  document.getElementById('emptyState').style.display = 'block';
  document.getElementById('loadingState').style.display = 'none';
  document.getElementById('resultContainer').style.display = 'none';
  document.querySelectorAll('.productItem').forEach(item => item.classList.remove('selected'));

  document.getElementById('uploadDressBtn').classList.toggle('active', dressSource === 'upload');
  document.getElementById('productDressBtn').classList.toggle('active', dressSource === 'product');
  document.getElementById('dressUploadSection').style.display = dressSource === 'upload' ? 'block' : 'none';
  document.getElementById('productSection').style.display = dressSource === 'product' ? 'block' : 'none';
}

function handleModelUpload(event) {
  const file = event.target.files[0];
  if (file) {
    modelFile = file;
    modelPreview = URL.createObjectURL(file);
    document.getElementById('modelPreviewWrapper').innerHTML = `
            <div class="previewWrapper">
                <img src="${modelPreview}" alt="Model" class="previewImage" />
                <button class="clearButton" onclick="clearModelImage()">×</button>
            </div>
        `;
  }
}

function clearModelImage() {
  modelFile = null;
  if (modelPreview) {
    URL.revokeObjectURL(modelPreview);
    modelPreview = null;
  }
  document.getElementById('modelPreviewWrapper').innerHTML = `
        <div class="uploadPlus">+</div>
        <div>Click to upload model image</div>
    `;
}

function setDressSource(source) {
  dressSource = source;
  document.getElementById('uploadDressBtn').classList.toggle('active', source === 'upload');
  document.getElementById('productDressBtn').classList.toggle('active', source === 'product');
  document.getElementById('dressUploadSection').style.display = source === 'upload' ? 'block' : 'none';
  document.getElementById('productSection').style.display = source === 'product' ? 'block' : 'none';
  if (source === 'product') {
    clearDressImage();
    clearPantsImage();
  } else {
    selectedProduct = null;
    document.getElementById('selectedProductPreview').style.display = 'none';
    document.getElementById('selectedProductPreview').innerHTML = '';
    document.querySelectorAll('.productItem').forEach(item => item.classList.remove('selected'));
  }
}

function handleDressUpload(event) {
  const file = event.target.files[0];
  if (file) {
    dressFile = file;
    dressPreview = URL.createObjectURL(file);
    document.getElementById('dressPreviewWrapper').innerHTML = `
            <div class="previewWrapper">
                <img src="${dressPreview}" alt="Dress" class="previewImage" />
                <button class="clearButton" onclick="clearDressImage()">×</button>
            </div>
        `;
  }
}

function clearDressImage() {
  dressFile = null;
  if (dressPreview) {
    URL.revokeObjectURL(dressPreview);
    dressPreview = null;
  }
  document.getElementById('dressPreviewWrapper').innerHTML = `
        <div class="uploadPlus">+</div>
        <div>Click to upload dress image</div>
    `;
}

function handlePantsUpload(event) {
  const file = event.target.files[0];
  if (file) {
    pantsFile = file;
    pantsPreview = URL.createObjectURL(file);
    document.getElementById('pantsPreviewWrapper').innerHTML = `
            <div class="previewWrapper">
                <img src="${pantsPreview}" alt="Pants" class="previewImage" />
                <button class="clearButton" onclick="clearPantsImage()">×</button>
            </div>
        `;
  }
}

function clearPantsImage() {
  pantsFile = null;
  if (pantsPreview) {
    URL.revokeObjectURL(pantsPreview);
    pantsPreview = null;
  }
  document.getElementById('pantsPreviewWrapper').innerHTML = `
        <div class="uploadPlus">+</div>
        <div>Click to upload pants image (optional)</div>
    `;
}

function selectProduct(id, name, imageUrl) {
  let displayImageUrl = imageUrl;
  if (!displayImageUrl.startsWith("http://") && !displayImageUrl.startsWith("https://")) {
    displayImageUrl = `${LOCALHOST_URL}/${IMAGE_PATH}${displayImageUrl.startsWith("/") ? imageUrl.slice(1) : imageUrl}`;
  }

  let apiImageUrl = imageUrl;
  if (!apiImageUrl.startsWith("http://") && !apiImageUrl.startsWith("https://")) {
    apiImageUrl = `${NGROK_URL}/${IMAGE_PATH}${apiImageUrl.startsWith("/") ? imageUrl.slice(1) : imageUrl}`;
  } else {
    apiImageUrl = apiImageUrl.replace("http://localhost:8080", NGROK_URL);
  }

  selectedProduct = { id, name, displayImageUrl, apiImageUrl };
  document.querySelectorAll('.productItem').forEach(item => item.classList.remove('selected'));
  document.querySelector(`.productItem[data-id="${id}"]`).classList.add('selected');
  document.getElementById('selectedProductPreview').style.display = 'block';
  document.getElementById('selectedProductPreview').innerHTML = `
        <img src="${displayImageUrl}" alt="${name}" />
    `;
}

async function handleGenerateImage() {
  if (!modelFile) {
    $.toast({ text: "Please upload a model image", icon: 'error', position: 'top-right' });
    return;
  }
  if (dressSource === "upload" && !dressFile) {
    $.toast({ text: "Please upload a dress image", icon: 'error', position: 'top-right' });
    return;
  }
  if (dressSource === "product" && !selectedProduct) {
    $.toast({ text: "Please select a product", icon: 'error', position: 'top-right' });
    return;
  }

  if (generatedImage) {
    URL.revokeObjectURL(generatedImage);
    generatedImage = null;
  }

  isLoading = true;
  document.getElementById('emptyState').style.display = 'none';
  document.getElementById('loadingState').style.display = 'flex';
  document.getElementById('resultContainer').style.display = 'none';
  document.getElementById('generateButton').textContent = 'Generating...';
  document.getElementById('generateButton').disabled = true;

  const formData = new FormData();
  formData.append("modelImage", modelFile);
  formData.append("useProductImage", dressSource === "product");

  if (dressSource === "upload") {
    formData.append("dressImage", dressFile);
    if (pantsFile) {
      formData.append("pantsImage", pantsFile);
    }
  } else {
    console.log("Sending productImageUrl:", selectedProduct.apiImageUrl);
    formData.append("productImageUrl", selectedProduct.apiImageUrl);
  }

  try {
    const response = await fetch(`${BASE_URL}/api/try-on`, {
      method: "POST",
      body: formData,
      headers: {
        "X-CSRF-TOKEN": document.querySelector('meta[name="_csrf"]').content
      }
    });

    if (response.ok) {
      21
      taskId = await response.text();
      // [CẬP NHẬT] Đặt thời gian chờ 19 giây nếu cả dressFile và pantsFile đều tồn tại, còn lại là 16 giây
      const waitTime = (dressSource === "upload" && dressFile && pantsFile) ? 22000 : 16000;
      setTimeout(async () => {
        2
        await fetchTryOnResult();
      }, waitTime);
    } else {
      const errorText = await response.text();
      $.toast({ text: errorText, icon: 'error', position: 'top-right' });
      resetLoadingState();
    }
  } catch (error) {
    $.toast({ text: "Failed to generate virtual try-on: " + error.message, icon: 'error', position: 'top-right' });
    resetLoadingState();
  }
}

async function fetchTryOnResult() {
  try {
    const response = await fetch(`${BASE_URL}/api/try-on/result/${taskId}`, {
      headers: {
        Accept: "image/jpeg"
      }
    });

    if (response.ok) {
      const blob = await response.blob();
      if (blob.type.startsWith('image/')) {
        generatedImage = URL.createObjectURL(blob);
        document.getElementById('generatedImage').src = generatedImage;
        document.getElementById('emptyState').style.display = 'none';
        document.getElementById('loadingState').style.display = 'none';
        document.getElementById('resultContainer').style.display = 'flex';
        resetLoadingState();
      } else {
        throw new Error("Response is not an image");
      }
    } else {
      const errorText = await response.text();
      $.toast({ text: "Failed to get try-on result: " + errorText, icon: 'error', position: 'top-right' });
      resetLoadingState();
    }
  } catch (error) {
    $.toast({ text: "An error occurred while checking the result: " + error.message, icon: 'error', position: 'top-right' });
    resetLoadingState();
  }
}

function resetLoadingState() {
  isLoading = false;
  document.getElementById('generateButton').textContent = 'Generate';
  document.getElementById('generateButton').disabled = false;
  if (!generatedImage) {
    document.getElementById('loadingState').style.display = 'none';
    document.getElementById('emptyState').style.display = 'block';
  }
}

function handleDownload() {
  if (generatedImage) {
    const link = document.createElement('a');
    link.href = generatedImage;
    link.download = 'virtual-try-on-result.jpg';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  }
}

function handleClearGenerated() {
  if (generatedImage) {
    URL.revokeObjectURL(generatedImage);
    generatedImage = null;
  }
  clearModelImage();
  clearDressImage();
  clearPantsImage();
  selectedProduct = null;
  taskId = null;
  document.getElementById('selectedProductPreview').style.display = 'none';
  document.getElementById('selectedProductPreview').innerHTML = '';
  document.querySelectorAll('.productItem').forEach(item => item.classList.remove('selected'));
  document.getElementById('emptyState').style.display = 'block';
  document.getElementById('loadingState').style.display = 'none';
  document.getElementById('resultContainer').style.display = 'none';
}

async function loadAllProducts() {
  try {
    const response = await fetch(`${BASE_URL}/api/try-on/images`, {
      method: 'GET',
      headers: {
        'Accept': 'application/json'
      }
    });

    if (response.ok) {
      const products = await response.json();
      const productGrid = document.getElementById('productGrid');
      productGrid.innerHTML = '';
      products.forEach(product => {
        const productItem = document.createElement('div');
        productItem.className = 'productItem';
        productItem.dataset.id = product.id;
        productItem.onclick = () => selectProduct(product.id, product.name, product.image);
        productItem.innerHTML = `
                    <img src="${product.image}" alt="${product.name}" class="productImage" />
                    <div class="productName">${product.name}</div>
                `;
        productGrid.appendChild(productItem);
      });
    } else {
      $.toast({ text: 'Không tải được sản phẩm', icon: 'error', position: 'top-right' });
    }
  } catch (error) {
    $.toast({ text: 'Lỗi khi tải sản phẩm: ' + error.message, icon: 'error', position: 'top-right' });
  }
}


const API_URL = "http://localhost:8000";
const userId = localStorage.getItem("userId") || "guest";
let messages = [];

function toggleChatbot() {
  const chatbotOverlay = document.getElementById("chatbotOverlay");
  const isOpening = chatbotOverlay.style.display !== "flex";
  chatbotOverlay.style.display = isOpening ? "flex" : "none";

  if (isOpening) {
    loadMessages();
    if (messages.length === 0) {
      setTimeout(() => {
        const welcomeMessage = {
          role: "assistant",
          content: "Xin chào! Tôi là KarmaAI, trợ lý ảo của Karma Shop. Tôi có thể giúp gì cho bạn hôm nay?"
        };
        messages.push(welcomeMessage);
        saveMessages();
        renderMessages();
      }, 1000);
    }
  } else {
    saveMessages();
  }
}

function loadMessages() {
  const savedMessages = localStorage.getItem(`chatMessages_${userId}`);
  messages = savedMessages ? JSON.parse(savedMessages) : [];
  renderMessages();
}

function saveMessages() {
  const limitedMessages = messages.slice(-100);
  localStorage.setItem(`chatMessages_${userId}`, JSON.stringify(limitedMessages));
}

function handleLogout() {
  localStorage.removeItem(`chatMessages_guest`);
  localStorage.removeItem("userId");
  console.log("Đã xóa lịch sử chat và userId trong localStorage");
}

function renderMessages() {
  const messagesContainer = document.getElementById("chatbotMessages");
  messagesContainer.innerHTML = "";
  messages.forEach(msg => {
    const messageDiv = document.createElement("div");
    messageDiv.className = `message ${msg.role}`;
    let content = msg.content;

    // Thay thế [Xem chi tiết](http://localhost:8080/product/[id]) bằng thẻ <a>
    content = content.replace(
      /\[Xem chi tiết\]\(http:\/\/localhost:8080\/product\/(\d+)\)/g,
      (match, productId) => {
        return `<a href="http://localhost:8080/product/${productId}" class="view-detail" onclick="handleLinkClick(${productId}); return false;">Xem chi tiết</a>`;
      }
    );

    // Thay thế [Xem chi tiết](#) bằng thẻ <a> dựa trên tên sản phẩm
    content = content.replace(
      /\[Xem chi tiết\]\(#\)/g,
      (match, offset, string) => {
        const lines = string.split('\n');
        const line = lines.find(line => line.includes(match));
        // Tìm ID từ "ID: [number]" trong dòng
        const idMatch = line.match(/ID: (\d+)/);
        let productId = idMatch ? idMatch[1] : '';

        // Nếu không tìm thấy ID, thử ánh xạ tên sản phẩm
        if (!productId) {
          const productName = line.match(/- (.*?)(?: - Giá:|$)/)?.[1]?.trim();
          const products = [
            { name: "Áo Polo nam Excool", id: "10" },
            { name: "Áo Polo Nam Pique Cotton USA", id: "12" },
            { name: "Áo giữ nhiệt Ex-Warm Lenzing Modal cổ ngắn", id: "13" },
            { name: "Áo thun Relaxed Fit 84RISING Venom Signature", id: "14" },
            { name: "Áo sơ mi dài tay cổ tàu Premium Poplin", id: "15" },
            { name: "Áo Sơ Mi Dài Tay Essentials Cotton", id: "16" },
            { name: "Áo phao dày Ultrawarm Puffer", id: "17" },
            { name: "Áo phao dày Ultrawarm Puffer có mũ", id: "18" },
            { name: "Áo Croptop Trendy Cổ V 7551", id: "19" },
            { name: "Áo Croptop Len 3 Lỗ 7436", id: "20" },
            { name: "Áo Singlet Thể Thao Chạy Bộ Nữ MOTIVE WOMAN Airwear", id: "21" },
            { name: "Áo Singlet MOTIVE WOMAN Simple Color", id: "22" },
            { name: "Quần Short Nữ Đa Năng MOTIVE WM SHORT", id: "23" },
            { name: "Quần Shorts Chạy Bộ 2 lớp Fast & Free III", id: "24" },
            { name: "Quần Jeans Nam Copper Denim OG Slim", id: "25" }
          ];
          const product = products.find(p => productName?.includes(p.name));
          productId = product ? product.id : '';
        }

        // Nếu vẫn không tìm thấy productId, trả về thông báo
        if (!productId) {
          console.warn("Không tìm thấy productId cho dòng:", line);
          return '<span class="view-detail-error">Không có thông tin chi tiết</span>';
        }

        return `<a href="http://localhost:8080/product/${productId}" class="view-detail" onclick="handleLinkClick(${productId}); return false;">Xem chi tiết</a>`;
      }
    );

    // Thay thế [Hình ảnh]([image_url]) bằng thẻ <img>
    content = content.replace(
      /\[Hình ảnh\]\((.*?)\)/g,
      '<img src="$1" alt="Product Image" style="max-width: 100px; margin-right: 10px; vertical-align: middle;" />'
    );

    messageDiv.innerHTML = content;
    messagesContainer.appendChild(messageDiv);
  });
  messagesContainer.scrollTop = messagesContainer.scrollHeight;
}

function handleLinkClick(productId) {
  if (productId) {
    window.location.href = `http://localhost:8080/product/${productId}`;
    toggleChatbot();
  } else {
    console.error("productId không hợp lệ:", productId);
  }
}

async function sendMessage() {
  const input = document.getElementById("chatbotInput");
  const content = input.value.trim();
  if (!content) return;

  const userMessage = { role: "user", content };
  messages.push(userMessage);
  renderMessages();
  saveMessages();
  input.value = "";

  const updatedMessages = [
    {
      role: "system",
      content: "Bạn là trợ lý ảo của Karma Shop. Giúp khách hàng tìm sản phẩm hoặc tư vấn dựa trên dữ liệu từ API http://localhost:8080/api/try-on/images."
    },
    ...messages
  ];

  try {
    const response = await fetch(API_URL, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ messages: updatedMessages })
    });

    if (response.ok) {
      const data = await response.json();
      const botMessage = { role: "assistant", content: data.response };
      setTimeout(() => {
        messages.push(botMessage);
        renderMessages();
        saveMessages();
      }, Math.random() * 1000 + 500);
    } else {
      throw new Error("Lỗi API");
    }
  } catch (error) {
    console.error("API Error:", error);
    setTimeout(() => {
      messages.push({
        role: "assistant",
        content: "Có lỗi xảy ra, vui lòng thử lại sau!"
      });
      renderMessages();
      saveMessages();
    }, 500);
  }
}