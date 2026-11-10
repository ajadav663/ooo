<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ShopGrid.aspx.cs" Inherits="ooo.ShopGrid" %>

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
            <symbol xmlns="http://www.w3.org/2000/svg" id="arrow-left" viewBox="0 0 32 32">
                <path fill="currentColor" d="m13.281 6.781l-8.5 8.5l-.687.719l.687.719l8.5 8.5l1.438-1.438L7.938 17H28v-2H7.937l6.782-6.781z" />
            </symbol>
            <symbol xmlns="http://www.w3.org/2000/svg" id="arrow-right" viewBox="0 0 32 32">
                <path fill="currentColor" d="M18.719 6.781L17.28 8.22L24.063 15H4v2h20.063l-6.782 6.781l1.438 1.438l8.5-8.5l.687-.719l-.687-.719z" />
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
                                            <a href="Blog4Column.aspx" class="dropdown-item item-anchor">Blog 4 Column <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
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
                                            <a href="ErrorPage.aspx" class="dropdown-item item-anchor">Error Page <span class="badge bg-secondary text-dark ms-2">PRO</span></a>
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
                                                <a href="Cart.aspx">
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
                    <h1 class="display-1">Shop-Grid</h1>
                    <div class="breadcrumbs">
                        <span class="item">
                            <a href="WebForm1.aspx">Home /</a>
                        </span>
                        <span class="item">Shop-Grid</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <main class="main-content py-5">
        <div class="container-fluid">
            <div class="row pb-5">
                <div class="col-md-9">
                    <span>Showing 1–12 of 55 results</span>
                </div>
                <div class="col-md-3">
                    <select class="form-select border-0 bg-transparent" aria-label="Default select example">
                        <option selected>Default Sorting</option>
                        <option value="1">Color</option>
                        <option value="2">Size</option>
                        <option value="3">Price</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 mb-5 product-item link-effect">
                    <div class="image-holder position-relative">
                        <a href="SingleProduct.aspx">
                            <img src="images/product-item1.jpg" alt="categories" class="product-image img-fluid">
                        </a>

                        <div class="product-content">
                            <h5 class="element-title text-capitalize fs-5 mt-3">
                                <a href="SingleProduct.aspx">Dark Ring</a>
                            </h5>
                            <a href="#" class="text-decoration-none" data-after="Add to cart">
                                <span>$95.00</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-5 product-item link-effect">
                    <div class="image-holder position-relative">
                        <a href="SingleProduct.aspx">
                            <img src="images/product-item2.jpg" alt="categories" class="product-image img-fluid">
                        </a>

                        <div class="product-content">
                            <h5 class="text-capitalize fs-5 mt-3">
                                <a href="SingleProduct.aspx">Gold Chain</a>
                            </h5>
                            <a href="#" class="text-decoration-none" data-after="Add to cart">
                                <span>$55.00</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-5 product-item link-effect">
                    <div class="image-holder position-relative">
                        <a href="SingleProduct.aspx">
                            <img src="images/product-item3.jpg" alt="categories" class="product-image img-fluid">
                        </a>

                        <div class="product-content">
                            <h5 class="text-capitalize fs-5 mt-3">
                                <a href="SingleProduct.aspx">Wedding Ring</a>
                            </h5>
                            <a href="#" class="text-decoration-none" data-after="Add to cart">
                                <span>$65.00</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-5 product-item link-effect">
                    <div class="image-holder position-relative">
                        <a href="SingleProduct.aspx">
                            <img src="images/product-item4.jpg" alt="categories" class="product-image img-fluid">
                        </a>

                        <div class="product-content">
                            <h5 class="text-capitalize fs-5 mt-3">
                                <a href="SingleProduct.aspx">Gold Ring</a>
                            </h5>
                            <a href="#" class="text-decoration-none" data-after="Add to cart">
                                <span>$50.00</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-5 product-item link-effect">
                    <div class="image-holder position-relative">
                        <a href="SingleProduct.aspx">
                            <img src="images/product-item5.jpg" alt="categories" class="product-image img-fluid">
                        </a>

                        <div class="product-content">
                            <h5 class="text-capitalize fs-5 mt-3">
                                <a href="SingleProduct.aspx">Silver Earing</a>
                            </h5>
                            <a href="#" class="text-decoration-none" data-after="Add to cart">
                                <span>$70.00</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-5 product-item link-effect">
                    <div class="image-holder position-relative">
                        <a href="SingleProduct.aspx">
                            <img src="images/product-item6.jpg" alt="categories" class="product-image img-fluid">
                        </a>

                        <div class="product-content">
                            <h5 class="text-capitalize fs-5 mt-3">
                                <a href="SingleProduct.aspx">Silver Ring</a>
                            </h5>
                            <a href="Cart.aspx " class="text-decoration-none" data-after="Add to cart">
                                <span>$95.00</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-5 product-item link-effect">
                    <div class="image-holder position-relative">
                        <a href="SingleProduct.aspx">
                            <img src="images/product-item7.jpg" alt="product" class="product-image img-fluid">
                        </a>

                        <div class="product-content">
                            <h5 class="text-capitalize fs-5 mt-3">
                                <a href="SingleProduct.aspx">Wedding Ring</a>
                            </h5>
                            <a href="Cart.aspx" class="text-decoration-none" data-after="Add to cart">
                                <span>$55.00</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-5 product-item link-effect">
                    <div class="image-holder position-relative">
                        <a href="SingleProduct.aspx">
                            <img src="images/product-item8.jpg" alt="categories" class="product-image img-fluid">
                        </a>

                        <div class="product-content">
                            <h5 class="text-capitalize fs-5 mt-3">
                                <a href="SingleProduct.aspx">Layer Chain</a>
                            </h5>
                            <a href="Cart.aspx" class="text-decoration-none" data-after="Add to cart">
                                <span>$65.00</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-5 product-item link-effect">
                    <div class="image-holder position-relative">
                        <a href="SingleProduct.aspx">
                            <img src="images/product-item9.jpg" alt="categories" class="product-image img-fluid">
                        </a>

                        <div class="product-content">
                            <h5 class="text-capitalize fs-5 mt-3">
                                <a href="SingleProduct.aspx">Floral Ring</a>
                            </h5>
                            <a href="Cart.aspx" class="text-decoration-none" data-after="Add to cart">
                                <span>$50.00</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-5 product-item link-effect">
                    <div class="image-holder position-relative">
                        <a href="SingleProduct.aspx">
                            <img src="images/product-item10.jpg" alt="categories" class="product-image img-fluid">
                        </a>

                        <div class="product-content">
                            <h5 class="text-capitalize fs-5 mt-3">
                                <a href="SingleProduct.aspx">Gold Ring</a>
                            </h5>
                            <a href="Cart.aspx" class="text-decoration-none" data-after="Add to cart">
                                <span>$70.00</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-5 product-item link-effect">
                    <div class="image-holder position-relative">
                        <a href="SingleProduct.aspx">
                            <img src="images/product-item11.jpg" alt="categories" class="product-image img-fluid">
                        </a>

                        <div class="product-content">
                            <h5 class="text-capitalize fs-5 mt-3">
                                <a href="SingleProduct.aspx">silver Necklace</a>
                            </h5>
                            <a href="Cart.aspx" class="text-decoration-none" data-after="Add to cart">
                                <span>$70.00</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-5 product-item link-effect">
                    <div class="image-holder position-relative">
                        <a href="SingleProduct.aspx">
                            <img src="images/product-item12.jpg" alt="categories" class="product-image img-fluid">
                        </a>

                        <div class="product-content">
                            <h5 class="text-capitalize fs-5 mt-3">
                                <a href="SingleProduct.aspx">Double Chain</a>
                            </h5>
                            <a href="Cart.aspx" class="text-decoration-none" data-after="Add to cart">
                                <span>$70.00</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <nav aria-label="Page navigation" class="d-flex justify-content-center mt-5">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <svg class="arrow-left" width="18" height="20">
                                <use xlink:href="#arrow-left"></use>
                            </svg>
                        </a>
                    </li>
                    <li class="page-item active" aria-current="page"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <svg class="arrow-right" width="18" height="20">
                                <use xlink:href="#arrow-right"></use>
                            </svg>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </main>
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
