<!doctype html>
<html>
<head>
    <title>Lecoincoin</title>
    <asset:stylesheet src="indexad.css"/>
    <asset:stylesheet src="admin.css"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
</head>
<body >
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
    <!-- Content -->
    <div id="content">
        <div class="displayAD">
            <sec:ifLoggedIn>
                <sec:ifAnyGranted roles="ROLE_USER, ROLE_ADMIN, ROLE_MODERATOR">
                    <div class = "card-wrapper">
                        <div class = "card">
                            <!-- card left -->
                            <div class = "product-imgs">
                                <div class="containerB">
                                    <div id="gallery" class="gallery">
                                        <!-- controllers -->
                                        <a class="gallery__controller gallery__controller--prev"></a>
                                        <a class="gallery__controller gallery__controller--next"></a>

                                        <div class="gallery__images" id ='imgs'>
                                            <!-- images -->
                                            <g:each in="${ad.getIllustrations()}" var = "i">
                                                <g:img dir="images" file="${i.getFilename()}" id ="${i.getId()}"></g:img>
                                            </g:each>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- card right -->
                            <div class = "product-content">
                                <h2 class = "product-title">${ad.getTitle()}</h2>
                            <br>
                                <div class = "product-price">
                                    <p class = "new-price">Price: <span>${ad.getPrice()}$</span></p>
                                </div>
                                <div class = "product-detail">
                                    <br>
                                    <br>
                                    <h4>Description: </h4>
                                    <p style = "font-size:15px  ">${ad.getDescription()}</p>
                                </div>

                            </div>
                        </div>
                    </div>
                </sec:ifAnyGranted>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
            </sec:ifNotLoggedIn>
        </div>


    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tiny-slider/2.9.2/min/tiny-slider.js"></script>
</body>
<script>
    let first = document.getElementById('imgs').firstElementChild
    let last = document.getElementById('imgs').lastElementChild
    first.setAttribute('class', 'active')
    const galleryWrapper = document.getElementById('gallery'),
        galleryControllers = galleryWrapper.querySelectorAll('.gallery__controller')

    galleryControllers.forEach(controller => {
        controller.addEventListener('click', (event) => {
            if(controller.classList.contains('gallery__controller--prev'))
                galleryGoBack()
            else
                galleryGoForward()
        })
    })

    function galleryGoBack(){
        const active = galleryWrapper.querySelector('img.active')
        active.classList.remove('active')

        if(active.previousElementSibling)
            active.previousElementSibling.classList.add('active')
        else {
            if (active == first)
                last.setAttribute('class', 'active')
            else
                this.galleryWrapper.querySelector('img:last-child').classList.add('active')
        }
    }

    function galleryGoForward(){
        const active = galleryWrapper.querySelector('img.active')
        active.classList.remove('active')

        if(active.nextElementSibling)
            active.nextElementSibling.classList.add('active')
        else
        {
            if(active == last)
                first.setAttribute('class', 'active')
            else
                this.galleryWrapper.querySelector('img').classList.add('active')
        }

    }
</script>
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
</html>

