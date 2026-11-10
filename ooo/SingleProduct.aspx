<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SingleProduct.aspx.cs" Inherits="ooo.SingleProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!DOCTYPE html>
    <html>
    <head>
        <title>Jewels - Jewelry and Accessories Store Website Template</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Cormorant+Upright:wght@300;400;500;600;700&family=Sofia+Sans:ital,wght@0,1..1000;1,1..1000&display=swap" rel="stylesheet">
        <!-- script
    ================================================== -->
        <script src="js/modernizr.js"></script>
    </head>
    <body class="bg-body" data-bs-spy="scroll" data-bs-target="#navbar" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" tabindex="0">
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
            <symbol id="search" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
                <title>Search</title>
                <path fill="currentColor" d="M19 3C13.488 3 9 7.488 9 13c0 2.395.84 4.59 2.25 6.313L3.281 27.28l1.439 1.44l7.968-7.969A9.922 9.922 0 0 0 19 23c5.512 0 10-4.488 10-10S24.512 3 19 3zm0 2c4.43 0 8 3.57 8 8s-3.57 8-8 8s-8-3.57-8-8s3.57-8 8-8z" />
            </symbol>
            <symbol xmlns="http://www.w3.org/2000/svg" id="user" viewBox="0 0 16 16">
                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z" />
            </symbol>
            <symbol xmlns="http://www.w3.org/2000/svg" id="cart" viewBox="0 0 16 16">
                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
            </symbol>
            <symbol xmlns="http://www.w3.org/2000/svg" id="nav-icon" viewBox="0 0 16 16">
                <path d="M14 10.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0 0 1h3a.5.5 0 0 0 .5-.5zm0-3a.5.5 0 0 0-.5-.5h-7a.5.5 0 0 0 0 1h7a.5.5 0 0 0 .5-.5zm0-3a.5.5 0 0 0-.5-.5h-11a.5.5 0 0 0 0 1h11a.5.5 0 0 0 .5-.5z" />
            </symbol>
            <symbol xmlns="http://www.w3.org/2000/svg" id="close" viewBox="0 0 16 16">
                <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z" />
            </symbol>
            <symbol xmlns="http://www.w3.org/2000/svg" id="navbar-icon" viewBox="0 0 16 16">
                <path d="M14 10.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0 0 1h3a.5.5 0 0 0 .5-.5zm0-3a.5.5 0 0 0-.5-.5h-7a.5.5 0 0 0 0 1h7a.5.5 0 0 0 .5-.5zm0-3a.5.5 0 0 0-.5-.5h-11a.5.5 0 0 0 0 1h11a.5.5 0 0 0 .5-.5z" />
            </symbol>
            <symbol xmlns="http://www.w3.org/2000/svg" id="arrow-right" viewBox="0 0 32 32">
                <path fill="currentColor" d="M18.719 6.781L17.28 8.22L24.063 15H4v2h20.063l-6.782 6.781l1.438 1.438l8.5-8.5l.687-.719l-.687-.719z" />
            </symbol>
            <symbol xmlns="http://www.w3.org/2000/svg" id="star-outline" viewBox="0 0 15 15">
                <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                    d="M7.5 9.804L5.337 11l.413-2.533L4 6.674l2.418-.37L7.5 4l1.082 2.304l2.418.37l-1.75 1.793L9.663 11L7.5 9.804Z" />
            </symbol>
            <symbol xmlns="http://www.w3.org/2000/svg" id="star-solid" viewBox="0 0 15 15">
                <path fill="currentColor"
                    d="M7.953 3.788a.5.5 0 0 0-.906 0L6.08 5.85l-2.154.33a.5.5 0 0 0-.283.843l1.574 1.613l-.373 2.284a.5.5 0 0 0 .736.518l1.92-1.063l1.921 1.063a.5.5 0 0 0 .736-.519l-.373-2.283l1.574-1.613a.5.5 0 0 0-.283-.844L8.921 5.85l-.968-2.062Z" />
            </symbol>
            <symbol xmlns="http://www.w3.org/2000/svg" id="plus" viewBox="0 0 24 24">
                <path fill="currentColor"
                    d="M19 11h-6V5a1 1 0 0 0-2 0v6H5a1 1 0 0 0 0 2h6v6a1 1 0 0 0 2 0v-6h6a1 1 0 0 0 0-2Z" />
            </symbol>
            <symbol xmlns="http://www.w3.org/2000/svg" id="minus" viewBox="0 0 24 24">
                <path fill="currentColor" d="M19 11H5a1 1 0 0 0 0 2h14a1 1 0 0 0 0-2Z" />
            </symbol>
            <symbol xmlns="http://www.w3.org/2000/svg" id="heart" viewBox="0 0 24 24">
                <path fill="currentColor"
                    d="M20.16 4.61A6.27 6.27 0 0 0 12 4a6.27 6.27 0 0 0-8.16 9.48l7.45 7.45a1 1 0 0 0 1.42 0l7.45-7.45a6.27 6.27 0 0 0 0-8.87Zm-1.41 7.46L12 18.81l-6.75-6.74a4.28 4.28 0 0 1 3-7.3a4.25 4.25 0 0 1 3 1.25a1 1 0 0 0 1.42 0a4.27 4.27 0 0 1 6 6.05Z" />
            </symbol>
        </svg>

        <div id="preloader">
            <span class="loader"></span>
        </div>

        <div class="search-box position-relative overflow-hidden w-100">
            <div class="search-wrap">
                <div class="close-button position-absolute">
                    <svg class="close" width="22" height="22">
                        <use xlink:href="#close"></use>
                    </svg>
                </div>
                <form id="search-form" class="text-center pt-3" action="" method="">
                    <input type="text" class="search-input fs-5 p-4 bg-transparent" placeholder="Search...">
                    <svg class="search" width="22" height="22">
                        <use xlink:href="#search"></use>
                    </svg>
                </form>
            </div>
        </div>

        <header id="header" class="site-header text-black">
            <nav id="header-nav" class="navbar navbar-expand-lg px-3">
                <div class="container-fluid">
                    <a class="navbar-brand" href="WebForm1.aspx">
                        <img src="images/main-logo.png" class="logo">
                    </a>
                    <button class="navbar-toggler d-flex d-lg-none order-3 p-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#bdNavbar" aria-controls="bdNavbar" aria-expanded="false" aria-label="Toggle navigation">
                        <svg class="navbar-icon" width="50" height="50">
                            <use xlink:href="#navbar-icon"></use>
                        </svg>
                    </button>
                    <div class="offcanvas offcanvas-end" tabindex="-1" id="bdNavbar" aria-labelledby="bdNavbarOffcanvasLabel">
                        <div class="offcanvas-header px-4 pb-0">
                            <a class="navbar-brand" href="WebForm1.aspx">
                                <img src="images/main-logo.png" class="logo">
                            </a>
                            <button type="button" class="btn-close btn-close-black" data-bs-dismiss="offcanvas" aria-label="Close" data-bs-target="#bdNavbar"></button>
                        </div>
                        <div class="offcanvas-body">
                            <ul id="navbar" class="navbar-nav text-capitalize justify-content-end align-items-center flex-grow-1 pe-3">
                                <li class="nav-item">
                                    <a class="nav-link me-4" href="WebForm1.aspx">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link me-4" href="about.aspx">About Us</a>
                                </li>
                                <li class="nav-item dropdown me-4">
                                    <a class="nav-link dropdown-toggle" href="#" id="dropdownPages" data-bs-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">Shop</a>
                                    <ul class="dropdown-menu list-unstyled" aria-labelledby="dropdownPages">
                                        <li>
                                            <a href="ShopSidebar.aspx" class="dropdown-item item-anchor">Shop Sidebar <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                        <li>
                                            <a href="ShopGrid.aspx" class="dropdown-item item-anchor">Shop Grid <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown me-4">
                                    <a class="nav-link dropdown-toggle" href="#" id="dropdownPages" data-bs-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">Blog</a>
                                    <ul class="dropdown-menu list-unstyled" aria-labelledby="dropdownPages">
                                        <li>
                                            <a href="BlogClassic.aspx" class="dropdown-item item-anchor">Blog Classic <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                        <li>
                                            <a href="BlogGridFourColumn.aspx" class="dropdown-item item-anchor">Blog 4 Column <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                        <li>
                                            <a href="BlogWithSidebar.aspx" class="dropdown-item item-anchor">Blog With Sidebar <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown me-4">
                                    <a class="nav-link dropdown-toggle" href="#" id="dropdownPages" data-bs-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">Pages</a>
                                    <ul class="dropdown-menu list-unstyled" aria-labelledby="dropdownPages">
                                        <li>
                                            <a href="about.aspx" class="dropdown-item item-anchor">About <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                        <li>
                                            <a href="Cart.aspx" class="dropdown-item item-anchor">Cart <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                        <li>
                                            <a href="Checkout.aspx" class="dropdown-item item-anchor">Checkout <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                        <li>
                                            <a href="Contact.aspx" class="dropdown-item item-anchor">Contact <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                        <li>
                                            <a href="error-page.html" class="dropdown-item item-anchor">Error Page <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                        <li>
                                            <a href="FAQs.aspx" class="dropdown-item item-anchor">FAQs <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                        <li>
                                            <a href="Account.aspx" class="dropdown-item item-anchor">My Account <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                        <li>
                                            <a href="OrderTracking.aspx" class="dropdown-item item-anchor">Order Tracking <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                        <li>
                                            <a href="Wishlist.aspx" class="dropdown-item item-anchor">Wishlist <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                        <li>
                                            <a href="SinglePost.aspx" class="dropdown-item item-anchor">Single Post <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                        <li>
                                            <a href="SingleProduct.aspx" class="dropdown-item item-anchor">Single Product <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link fw-bold" target="_blank" href="https://templatesjungle.gumroad.com/l/jewels-jewellery-ecommerce-website-template">GET PRO</a>
                                </li>
                                <li class="nav-item">
                                    <div class="user-items ps-5">
                                        <ul class="d-flex justify-content-end list-unstyled">
                                            <li class="search-item pe-3" data-bs-toggle="collapse" data-bs-target="#search-box" aria-controls="search-box" aria-expanded="false" aria-label="Toggle navigation">
                                                <svg class="search" width="18" height="18">
                                                    <use xlink:href="#search"></use>
                                                </svg>
                                            </li>
                                            <li class="pe-3">
                                                <a href="#">
                                                    <svg class="user" width="18" height="18">
                                                        <use xlink:href="#user"></use>
                                                    </svg>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="cart.html">
                                                    <svg class="cart" width="18" height="18">
                                                        <use xlink:href="#cart"></use>
                                                    </svg>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
        </header>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="hero-section d-flex align-items-center margin-large">
        <div class="container-fluid">
            <div class="row">
                <div class="hero-content align-items-center">
                    <h1 class="display-1">Single-Product</h1>
                    <div class="breadcrumbs">
                        <span class="item">
                            <a href="WebForm1.aspx">Home /</a>
                        </span>
                        <span class="item">Single-Product</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="product-detail" class="single-product py-5 no-padding-top">
        <div class="container">
            <div class="row g-5">
                <div class="col-md-7">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="swiper product-thumbnail-slider">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <img src="images/product-thumbnail-1.jpg" alt="image" class="thumb-image img-fluid">
                                    </div>
                                    <div class="swiper-slide">
                                        <img src="images/product-thumbnail-2.jpg" alt="image" class="thumb-image img-fluid">
                                    </div>
                                    <div class="swiper-slide">
                                        <img src="images/product-thumbnail-3.jpg" alt="image" class="thumb-image img-fluid">
                                    </div>
                                    <div class="swiper-slide">
                                        <img src="images/product-thumbnail-4.jpg" alt="image" class="thumb-image img-fluid">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="swiper product-large-slider">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <img src="images/product-large-1.jpg" alt="product-large" class="img-fluid">
                                    </div>
                                    <div class="swiper-slide">
                                        <img src="images/product-large-2.jpg" alt="product-large" class="img-fluid">
                                    </div>
                                    <div class="swiper-slide">
                                        <img src="images/product-large-3.jpg" alt="product-large" class="img-fluid">
                                    </div>
                                    <div class="swiper-slide">
                                        <img src="images/product-large-4.jpg" alt="product-large" class="img-fluid">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="product-info">
                        <div class="element-header">
                            <h2 itemprop="name" class="product-title text-capitalize">Teardrop Earrings</h2>
                            <div class="rating-container d-flex align-items-center">
                                <div class="rating" data-rating="1" onclick="rate(1)">
                                    <svg width="32" height="32">
                                        <use xlink:href="#star-solid"></use>
                                    </svg>
                                </div>
                                <div class="rating" data-rating="2" onclick="rate(1)">
                                    <svg width="32" height="32">
                                        <use xlink:href="#star-solid"></use>
                                    </svg>
                                </div>
                                <div class="rating" data-rating="3" onclick="rate(1)">
                                    <svg width="32" height="32">
                                        <use xlink:href="#star-solid"></use>
                                    </svg>
                                </div>
                                <div class="rating" data-rating="4" onclick="rate(1)">
                                    <svg width="32" height="32">
                                        <use xlink:href="#star-outline"></use>
                                    </svg>
                                </div>
                                <div class="rating" data-rating="5" onclick="rate(1)">
                                    <svg width="32" height="32">
                                        <use xlink:href="#star-outline"></use>
                                    </svg>
                                </div>
                            </div>
                        </div>
                        <div class="product-price mb-3">
                            <span class="fs-2">$540.00</span>
                            <del>$64.00</del>
                        </div>
                        <p>
                            Tristique ullamcorper nunc egestas non. Justo, cum feugiat imperdiet nulla molestie ac vulputate
                scelerisque amet. Bibendum adipiscing platea blandit sit sed quam semper rhoncus. Diam ultrices maecenas
                consequat eu tortor. Orci, cras lectus mauris, cras egestas quam venenatis neque.
                        </p>
                        <div class="product-action mt-4">
                            <div class="item-title">3 in stock</div>
                            <div class="product-quantity d-flex flex-wrap">
                                <div class="input-group product-qty me-3 border" style="max-width: 150px;">
                                    <span class="input-group-btn">
                                        <button type="button" class="quantity-left-minus btn btn-number" data-type="minus"
                                            data-field="">
                                            <svg width="16" height="16">
                                                <use xlink:href="#minus"></use>
                                            </svg>
                                        </button>
                                    </span>
                                    <input type="text" id="quantity" name="quantity" class="form-control input-number text-center bg-gray-1"
                                        value="1" min="1" max="100">
                                    <span class="input-group-btn">
                                        <button type="button" class="quantity-right-plus btn btn-number" data-type="plus"
                                            data-field="">
                                            <svg width="16" height="16">
                                                <use xlink:href="#plus"></use>
                                            </svg>
                                        </button>
                                    </span>
                                </div>
                                <button type="submit" name="add" id="add-to-cart"
                                    class="btn btn-primary product-cart-submit me-3">
                                    <span id="add-to-cart">Add to cart</span>
                                </button>
                                <button href="#" class="btn btn-light wish-list-button">
                                    <svg width="24" height="24" viewBox="0 0 24 24">
                                        <use xlink:href="#heart"></use>
                                    </svg>
                                </button>
                                <div class="detail-list mt-3">
                                    <ul>
                                        <li>
                                            <strong>SKU:</strong>
                                            <a href="#">Woo-Belt</a>
                                        </li>
                                        <li>
                                            <strong>Category:</strong>
                                            <a href="#">Accessories</a>
                                        </li>
                                        <li class="no-border-bottom">
                                            <strong>Tags:</strong>
                                            <a href="#">Black</a>, <a href="#">Wooden</a>, <a href="#">Minimal</a>, <a href="#">Chair</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="product-tabs mt-5">
        <div class="container">
            <div class="row">
                <div class="tabs-listing">
                    <nav>
                        <div class="nav nav-tabs d-flex justify-content-center" id="nav-tab" role="tablist">
                            <button class="nav-link active text-capitalize px-5 py-3 text-primary" id="nav-home-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home"
                                aria-selected="true">
                                Description</button>
                            <button class="nav-link text-capitalize px-5 py-3 text-primary" id="nav-information-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-information" type="button" role="tab" aria-controls="nav-information"
                                aria-selected="false">
                                Additional information</button>
                            <button class="nav-link text-capitalize px-5 py-3 text-primary" id="nav-shipping-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-shipping" type="button" role="tab" aria-controls="nav-shipping"
                                aria-selected="false">
                                Shipping & Return</button>
                            <button class="nav-link text-capitalize px-5 py-3 text-primary" id="nav-review-tab" data-bs-toggle="tab"
                                data-bs-target="#nav-review" type="button" role="tab" aria-controls="nav-review"
                                aria-selected="false">
                                Reviews</button>
                        </div>
                    </nav>
                    <div class="tab-content py-5" id="nav-tabContent">
                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                            <h5>Product Description</h5>
                            <p>
                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.
                  Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede. Donec
                  nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim
                  pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula
                  vulputate sem tristique cursus.
                <ul>
                    <li>Donec nec justo eget felis facilisis fermentum.</li>
                    <li>Suspendisse urna viverra non, semper suscipit pede.</li>
                    <li>Aliquam porttitor mauris sit amet orci.</li>
                </ul>
                                Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis
                eros. Nullam malesuada erat ut turpis. Suspendisse urna viverra non, semper suscipit, posuere a, pede.
                Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim
                pellentesque felis. Phasellus ultrices nulla quis nibh. Quisque a lectus. Donec consectetuer ligula
                vulputate sem tristique cursus.
                            </p>
                        </div>
                        <div class="tab-pane fade" id="nav-information" role="tabpanel" aria-labelledby="nav-information-tab">
                            <h5>It is Comfortable and Best</h5>
                            <p>
                                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
                  pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
                  anim id est laborum. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                  fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                  deserunt mollit anim id est laborum.
                            </p>
                        </div>
                        <div class="tab-pane fade" id="nav-shipping" role="tabpanel" aria-labelledby="nav-shipping-tab">
                            <h5>Returns Policy</h5>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eros justo, accumsan non dui sit amet.
                  Phasellus semper volutpat mi sed imperdiet. Ut odio lectus, vulputate non ex non, mattis sollicitudin
                  purus. Mauris consequat justo a enim interdum, in consequat dolor accumsan. Nulla iaculis diam purus,
                  ut vehicula leo efficitur at.
                            </p>
                            <p>
                                Interdum et malesuada fames ac ante ipsum primis in faucibus. In blandit nunc enim, sit amet pharetra
                  erat aliquet ac.
                            </p>
                            <h5>Shipping</h5>
                            <p>
                                Pellentesque ultrices ut sem sit amet lacinia. Sed nisi dui, ultrices ut turpis pulvinar. Sed
                  fringilla ex eget lorem consectetur, consectetur blandit lacus varius. Duis vel scelerisque elit, et
                  vestibulum metus. Integer sit amet tincidunt tortor. Ut lacinia ullamcorper massa, a fermentum arcu
                  vehicula ut. Ut efficitur faucibus dui Nullam tristique dolor eget turpis consequat varius. Quisque a
                  interdum augue. Nam ut nibh mauris.
                            </p>
                        </div>
                        <div class="tab-pane fade" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">
                            <div class="review-box review-style1 d-flex">
                                <div class="review-item d-flex">
                                    <div class="row g-4">
                                        <div class="col-md-3">
                                            <div class="image-holder">
                                                <img src="images/review-image1.jpg" alt="review" class="rounded-circle img-fluid">
                                            </div>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="review-content">
                                                <div class="rating-container d-flex align-items-center">
                                                    <div class="rating" data-rating="1" onclick="rate(1)">
                                                        <svg width="32" height="32">
                                                            <use xlink:href="#star-solid"></use>
                                                        </svg>
                                                    </div>
                                                    <div class="rating" data-rating="2" onclick="rate(1)">
                                                        <svg width="32" height="32">
                                                            <use xlink:href="#star-solid"></use>
                                                        </svg>
                                                    </div>
                                                    <div class="rating" data-rating="3" onclick="rate(1)">
                                                        <svg width="32" height="32">
                                                            <use xlink:href="#star-solid"></use>
                                                        </svg>
                                                    </div>
                                                    <div class="rating" data-rating="4" onclick="rate(1)">
                                                        <svg width="32" height="32">
                                                            <use xlink:href="#star-outline"></use>
                                                        </svg>
                                                    </div>
                                                    <div class="rating" data-rating="5" onclick="rate(1)">
                                                        <svg width="32" height="32">
                                                            <use xlink:href="#star-outline"></use>
                                                        </svg>
                                                    </div>
                                                </div>
                                                <div class="review-header">
                                                    <span class="author-name">Serena Wilson</span>
                                                    <span class="review-date">– 07/05/2024</span>
                                                </div>
                                                <p>
                                                    Vitae tortor condimentum lacinia quis vel eros donec ac. Nam at lectus urna duis convallis
                            convallis
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="review-item d-flex">
                                    <div class="row g-4">
                                        <div class="col-md-3">
                                            <div class="image-holder">
                                                <img src="images/review-image2.jpg" alt="review" class="rounded-circle img-fluid">
                                            </div>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="review-content">
                                                <div class="rating-container d-flex align-items-center">
                                                    <div class="rating" data-rating="1" onclick="rate(1)">
                                                        <svg width="32" height="32">
                                                            <use xlink:href="#star-solid"></use>
                                                        </svg>
                                                    </div>
                                                    <div class="rating" data-rating="2" onclick="rate(1)">
                                                        <svg width="32" height="32">
                                                            <use xlink:href="#star-solid"></use>
                                                        </svg>
                                                    </div>
                                                    <div class="rating" data-rating="3" onclick="rate(1)">
                                                        <svg width="32" height="32">
                                                            <use xlink:href="#star-solid"></use>
                                                        </svg>
                                                    </div>
                                                    <div class="rating" data-rating="4" onclick="rate(1)">
                                                        <svg width="32" height="32">
                                                            <use xlink:href="#star-outline"></use>
                                                        </svg>
                                                    </div>
                                                    <div class="rating" data-rating="5" onclick="rate(1)">
                                                        <svg width="32" height="32">
                                                            <use xlink:href="#star-outline"></use>
                                                        </svg>
                                                    </div>
                                                </div>
                                                <div class="review-header">
                                                    <span class="author-name">Jenny Willis</span>
                                                    <span class="review-date">– 07/05/2024</span>
                                                </div>
                                                <p>
                                                    Vitae tortor condimentum lacinia quis vel eros donec ac. Nam at lectus urna duis convallis
                            convallis
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <footer id="footer" class="overflow-hidden padding-large">
        <div class="container-fluid">
            <div class="row">
                <div class="row d-flex flex-wrap justify-content-between">
                    <div class="col-lg-3 col-sm-6 pb-3 pe-4">
                        <div class="footer-menu">
                            <img src="images/main-logo.png" alt="logo" class="pb-3">
                            <p>Mi facilisis facilisis orci vitae. Cum nisi morbi integer tincidunt ornare ac praesent in. Dolor tempus arcu sit quis nunc arcu facilisis quis eget nisi morbi integer.</p>
                        </div>
                        <div class="copyright">
                            <p>
                                © Copyright 2024. HTML Template by <a href="https://templatesjungle.com/" target="_blank">TemplatesJungle</a>
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-2 col-sm-6 pb-3">
                        <div class="footer-menu text-capitalize">
                            <h5 class="widget-title pb-2">Quick Links</h5>
                            <ul class="menu-list list-unstyled text-capitalize">
                                <li class="menu-item pb-2">
                                    <a href="#billboard">Home</a>
                                </li>
                                <li class="menu-item pb-2">
                                    <a href="#about-us">About</a>
                                </li>
                                <li class="menu-item pb-2">
                                    <a href="#company-services">Services</a>
                                </li>
                                <li class="menu-item pb-2">
                                    <a href="#latest-blog">Blogs</a>
                                </li>
                                <li class="menu-item pb-2">
                                    <a href="#contact">Contact</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-2 col-sm-6 pb-3">
                        <div class="footer-menu text-capitalize">
                            <h5 class="widget-title pb-2">Social</h5>
                            <div class="social-links">
                                <ul class="list-unstyled">
                                    <li class="pb-2">
                                        <a href="#">Facebook</a>
                                    </li>
                                    <li class="pb-2">
                                        <a href="#">Twitter</a>
                                    </li>
                                    <li class="pb-2">
                                        <a href="#">Pinterest</a>
                                    </li>
                                    <li class="pb-2">
                                        <a href="#">Instagram</a>
                                    </li>
                                    <li>
                                        <a href="#">Youtube</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-menu contact-item">
                            <h5 class="widget-title text-capitalize pb-2">Contact Us</h5>
                            <p><a href="#">+ 12(0) 34 56 78 910</a></p>
                            <p><a href="mailto:">info@yourmail.com</a></p>
                            <p>tea berry, marinette, USA</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="js/plugins.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>
</asp:Content>
