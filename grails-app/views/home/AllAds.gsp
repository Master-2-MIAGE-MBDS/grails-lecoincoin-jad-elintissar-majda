<!doctype html>
<html>
<head>
    <title>Lecoincoin</title>
<asset:stylesheet src="index.css"/>
<asset:stylesheet src="ads.css"/>
<asset:javascript src="Usertab.js"/>
<asset:javascript src="jquery-2.2.0.min.js"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
</head>
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

                     <main class="flex-container">


                            </main>
                        </section>
                        <section id="panel-2">
<sec:ifLoggedIn>
    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
                            <div class="container" id="Ads">
                                <main id="table1">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th>ID</th>
                                            <th></th>
                                            <th>Author</th>
                                            <th></th>
                                            <th>Title</th>
                                            <th></th>
                                            <th>Description</th>
                                            <th></th>
                                            <th>Price</th>
                                            <th></th>
                                            <th colspan="30"> Illustrations</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                                          <g:uploadForm controller = "api" action = "annonces" enctype="multipart/form-data">
                                            <tr class="first-tr">
                                                <td class="title-td"></td>
                                                <td></td>
                                                <td></td>
                                                <td class="static"><input type="text" class="form-control" name="author"></td>
                                                <td></td>
                                                <td class="static"><input type="text" class="form-control" name="title"></td>
                                                <td></td>
                                                <td class="static"><input type="text" class="form-control" name="description"></td>
                                                <td></td>
                                                <td class="static"><input type="number" class="form-control" name="price"></td>
                                                <td></td>
                                                <td><input type="file" id="illustration" name="illustration"  multiple accept="image/*"></td>
                                                <td></td>
                                                <td class="static"><button type="submit"  style="border-radius: 10px;border: 1px;width: 30px; color:green"><i class="glyphicon glyphicon-ok"></i></button></td>
                                            </tr>
                                          </g:uploadForm>
                                            </sec:ifAnyGranted>
                                        <g:each in="${annoncesList}" var="a">
                                            <tr>
                                                <td></td>
                                                <td><a href = "/home/ad/${a.getId()}">${a.getId() }</a></td>
                                                <td></td>
                                                <td id="auteur${a.getId()}"><a href = "/home/ad/${a.getId()}">${a.getAuthor().getUsername()}</a></td>
                                                <td></td>
                                                <td id="titre${a.getId()}"><a href = "/home/ad/${a.getId()}">${a.getTitle()}</a></td>
                                                <td></td>
                                                <td id="desc${a.getId()}">${a.getDescription()}</td>
                                                <td></td>
                                                <td id="prix${a.getId()}">${a.getPrice()}</td>
                                                <td></td>
                                                <td>
                                                    <div class="grid-container">
                                                        <g:each in="${a.getIllustrations()}" var = "i">
                                                            <g:img dir="images" file="${i.getFilename()}" class="illusAdmin"></g:img>
                                                        </g:each>
                                                    </div>
                                                </td>
                                                <td></td>
                                                <td class="static"><button  style="border-radius: 10px;border: 1px;width: 30px;"class="button grey" id="buttonEdit" value="${a.getId()}"><i class="glyphicon glyphicon-pencil"></i> </button>
                                            <sec:ifAnyGranted roles="ROLE_ADMIN"> <button type="submit"   style="border-radius: 10px;border: 1px;width: 30px;" class="button red" id="Delete_annonce" value="${a.getId()}"  ><i class="glyphicon glyphicon-remove"></i> </button></sec:ifAnyGranted></td>
                                            </tr>


                                        </g:each>

                                        </tbody>
                                    </table>

                                </main>
                            </div>


        </section>
        <div class="editContainer" id = 'editAd' style = "display: none">
            <div id="editform" style ="margin-left: 15px">
                    <span>
                        <label for="editAuthor">Auteur</label>
                        <br>
                        <input type="text" id="editAuthor" name="title" placeholder="">
                        <br>
                        <label for="editTitle">Title</label>
                        <br>
                        <input type="text" id="editTitle" name="title" placeholder="">
                        <br>
                        <label for="editPrice">Price</label>
                        <br>
                        <input type="number" id="editPrice" name="price" placeholder="">
                        <br>
                        <label for="editDescription">Description</label>
                        <br>
                        <textarea id="editDescription" name="description" placeholder="" style="height:70px"></textarea>
                        <br>

                        <label for="editIllustration">Illustrations</label>
                        <br>
                        <input type="file" id="editIllustration" name="editIllustration"  multiple accept="image/*">
                        <br>
                        <button class = "buttonz" type="submit" onclick="patchUs()">EDIT</button>
                    </span>
                <button id="buttonCancel" class="buttonED"  onclick="cancel();">Cancel</button>
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





</body>



<script type="text/javascript">

    let origin = location.origin;
    let adId
    function patchUs(){
        var AuthorV = document.getElementById('editAuthor').value;
        var TitleV = document.getElementById('editTitle').value;
        var PriceV= document.getElementById('editPrice').value;
        var DescriptionV = document.getElementById('editDescription').value;
        const data = {
            id : adId,
            author: AuthorV,
            title: TitleV,
            price: PriceV,
            description: DescriptionV,
            illustrations: ''
        };

        if(AuthorV == '' || TitleV == '' || PriceV == '' || DescriptionV == '')
        {
            var url = origin+"/api/annonce";
            var xhr = new XMLHttpRequest();
            const searchParams = new URLSearchParams(data);

            xhr.open("PATCH", url, true);
            xhr.send(searchParams);
            setTimeout(function(){
                window.location.reload();
            }, 650);

        }
        else {
            var url = origin+"/api/annonce";
            var xhr = new XMLHttpRequest();
            const searchParams = new URLSearchParams(data);

            xhr.open("PUT", url, true);
            xhr.send(searchParams);
            setTimeout(function(){
                window.location.reload();
            }, 650);

        }
    }
    $(document).on('click', '#Delete_annonce', function () {
        var adId = $(this).val();
        var xhttp = new XMLHttpRequest();
        xhttp.open("DELETE", origin+"/api/annonce/" + adId, true);
        xhttp.send();
        setTimeout(function(){
            window.location.reload();
        }, 700);
    });

    $(document).on('click', '#buttonEdit', function (event) {
        adId = $(this).val();
        document.getElementById('editAuthor').setAttribute('placeholder',document.getElementById('auteur'+adId).textContent)
        document.getElementById('editTitle').setAttribute('placeholder',document.getElementById('titre'+adId).textContent)
        document.getElementById('editPrice').setAttribute('placeholder',document.getElementById('prix'+adId).textContent)
        document.getElementById('editDescription').setAttribute('placeholder',document.getElementById('desc'+adId).textContent)
        document.getElementById('editAd').style.display = "block";
        document.getElementById('Ads').style.display = "none";
    });
    function cancel(){
        document.getElementById('editAd').style.display = "none";
        document.getElementById('Ads').style.display = "block";
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