<!doctype html>
<html>
<head>
    <title>Lecoincoin</title>
    <asset:stylesheet src="index.css"/>
    <asset:stylesheet src="admin.css"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<body>

<nav class="sidebar close">
    <header>
        <div class="image-text">
            <span class="image">
                <!--<img src="logo.png" alt="">-->
            </span>

            <div class="text logo-text">
                <span class="name">LeCoinCoin</span>
            </div>
        </div>

        <i class='bx bx-chevron-right toggle'></i>
    </header>

    <div class="menu-bar">
        <div class="menu">



            <ul class="menu-links">
                <li class="nav-link">
                    <sec:ifAnyGranted roles="ROLE_USER">
                    <a href="/home/index">
                        <i class='bx bx-home-alt icon' ></i>
                        <span class="text nav-text">Home</span>
                    </a>
                    </sec:ifAnyGranted>
                    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
                        <a href="/home/index">
                            <i class='bx bx-home-alt icon' ></i>
                            <span class="text nav-text">Home</span>
                        </a>
                    </sec:ifAnyGranted>

                </li>

                <li class="nav-link">
                    <sec:ifAnyGranted roles="ROLE_USER">
                    <a href="/home/myaccount">
                        <i class='bx bx-user icon' ></i>
                        <span class="text nav-text">My Account</span>
                    </a>
                    </sec:ifAnyGranted>
                     <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
                    <a href="/home/AllUsers">
                        <i class='bx bx-user icon' ></i>
                        <span class="text nav-text">Users</span>
                    </a>
                     </sec:ifAnyGranted>
                </li>


                    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
                        <li class="nav-link">
                    <a href="/home/AllAds">
                        <i class='bx bx-pie-chart-alt icon' ></i>
                        <span class="text nav-text">Ads</span>
                    </a>
                </li>
                    </sec:ifAnyGranted>


            </ul>
        </div>

        <div class="bottom-content">
            <li class="">
                <a href="/logout/index">
                    <i class='bx bx-log-out icon' ></i>
                    <span class="text nav-text">Logout</span>
                </a>
            </li>
            <li class="mode">
                <div class="sun-moon">
                    <i class='bx bx-moon icon moon'></i>
                    <i class='bx bx-sun icon sun'></i>
                </div>
                <span class="mode-text text">Dark mode</span>

                <div class="toggle-switch">
                    <span class="switch"></span>
                </div>
            </li>


        </div>
    </div>

</nav>
<div class="container-fluid" >
    <sec:ifLoggedIn>
        <sec:ifAnyGranted roles="ROLE_USER, ROLE_ADMIN, ROLE_MODERATOR">

            <div class="container">
                <g:each in="${annoncesList}" var="c">

                    <div class="col-xs-12 col-md-6">
                        <!-- First product box start here-->
                        <div class="prod-info-main prod-wrap clearfix">
                        <br><br>
                            <div class="row">

                               <br>
                                <div class="col-md-5 col-sm-12 col-xs-12">
                                    <div class="product-image">
                                        <div class="swiper">
                                            <!-- Additional required wrapper -->
                                            <div class="swiper-wrapper">
                                            <!-- Slides -->
                                                <g:each in="${c.getIllustrations()}" var = "i">
                                                    <div class="swiper-slide"><g:img dir="images" file="${i.getFilename()}" class="illus"/></div>
                                                </g:each>

                                            </div>
                                            <!-- If we need pagination -->
                                            <div class="swiper-pagination"></div>

                                            <!-- If we need navigation buttons -->
                                            <div class="swiper-button-prev"></div>
                                            <div class="swiper-button-next"></div>


                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-7 col-sm-12 col-xs-12">
                                    <div class="product-deatil">
                                        <h5 class="name">

                                                ${c.getTitle()}

                                            <a>
                                                <span><br></span>
                                            </a>

                                        </h5>
                                        <p class="price-container">
                                            <span>${c.getPrice()}$</span>
                                        </p>

                                    </div>
                                    <div class="description">
                                        <p>${c.getDescription()}</p>
                                        <a class="btn btn-primary" href="/home/ad/${c.getId()}" role="button">Check it</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- end product -->
                    </div>
                </g:each>
            </div>
        </sec:ifAnyGranted>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
    </sec:ifNotLoggedIn>
</div>


<script>
    const body = document.querySelector('body'),
        sidebar = body.querySelector('nav'),
        toggle = body.querySelector(".toggle"),
        modeSwitch = body.querySelector(".toggle-switch"),
        modeText = body.querySelector(".mode-text");


    toggle.addEventListener("click" , () =>{
        sidebar.classList.toggle("close");
    })

    modeSwitch.addEventListener("click" , () =>{
        body.classList.toggle("dark");

        if(body.classList.contains("dark")){
            modeText.innerText = "Light mode";
        }else{
            modeText.innerText = "Dark mode";

        }
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<script>
    const swiper = new Swiper('.swiper', {
        loop: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        }
    });

</script>
</body>
</html>
