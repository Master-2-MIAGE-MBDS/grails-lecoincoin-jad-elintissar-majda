<!doctype html>
<html>
<head>
    <title>Lecoincoin</title>
    <asset:stylesheet src="index.css"/>

    <asset:stylesheet src="user.css"/>
    <asset:javascript src="Usertab.js"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
</head>
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

    <!-- Content -->
    <div id="content">

        <div class="container-fluid">
            <sec:ifLoggedIn>
                <sec:ifAnyGranted roles="ROLE_USER">


                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN , ROLE_MODERATOR">
                    <div class="container">
                        <section id="Users">
                            <div class="container">
                                <main id="table">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th>ID</th>
                                            <th></th>
                                            <th>Username</th>
                                            <th>Role</th>
                                            <th>Password</th>
                                            <th colspan="20">Announces</th>

                                        </tr>
                                        </thead>
                                        <tbody>
                       <sec:ifAnyGranted roles="ROLE_ADMIN">
                                            <tr class="first-tr">
                                                <td  class="title-td"></td>
                                                <td></td>
                                                <td></td>
                                                <td class="static"><input type="text" id="username" name="username" class="form-control"></td>
                                                <td class="static"><input type="text" id="role" class="form-control" name="role"></td>
                                                <td class="static"><input type="text" id="password" name="password"class="form-control"></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>

                                                <td class="static"><button onclick="addUser()" class="button green" style="border-radius: 10px;border: 1px;width: 30px; color:green" id="buttonAdd"><i class="glyphicon glyphicon-ok"></i></button></td>
                                            </tr>
                       </sec:ifAnyGranted>
                                        <g:each in="${usersList}" var="c">
                                            <tr>
                                                <td></td>
                                                <td>${c.getId() } </td>
                                                <td></td>
                                                <td id="auteur${c.getId()}">${c.getUsername()}</td>
                                                <td id="role${c.getId()}">${c.getAuthorities()}</td>
                                                <td id="password${c.getId()}">*********</td>
                                                <td>
                                                    <g:each in="${c.getAnnonces()}" var="x">
                                                        <a href = "/home/ad/${c.getId()}">
                                                            ${x.getId()}
                                                        </a>
                                                    </g:each>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td class="static" ><button style="border-radius: 10px;border: 1px;width: 30px;" class="button grey" id="buttonEdit" value="${c.getId()}"> <i class="glyphicon glyphicon-pencil"></i> </button>
                                                    <sec:ifAnyGranted roles="ROLE_ADMIN"> <button style="border-radius: 10px;border: 1px;width: 30px;" class="button red" id="Delete_user" value="${c.getId()}" ><i class="glyphicon glyphicon-remove"></i></button></sec:ifAnyGranted></td>
                                            </tr>
                                        </g:each>

                                        </tbody>
                                    </table>

                                </main>
                            </div>

                        </section>
                        <div class="editContainer" id = 'editUser' style = "display: none">
                            <div id="editform" style = "margin-left: 15px">
                                    <span>
                                        <input type="text" id="editId" name="id" style = "display: none">
                                        <label for="editusername">Username</label>
                                        <br>

                                        <input type="text" id="editusername" name="username" placeholder="">
                                        <br>

                                        <label for="editpassword">Password</label>
                                        <br>

                                        <input type="password" id="editpassword" name="password" placeholder="">
                                        <br>

                                        <label for="editrole">Role</label>
                                        <br>
                                        <input type="text" id="editrole" name="role" placeholder="">
                                        <br><br>
                                        <button class="buttonz"  type="submit" id = 'submitEditForm' onclick = 'patchUs()'>EDIT</button>
                                    </span>
                                <button id="buttonCancel" class="buttonED"  onclick="cancel()">Cancel</button>
                            </div>
                        </div>

                    </div>
                </sec:ifAnyGranted>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
            </sec:ifNotLoggedIn>
        </div>


    </div>
</body>
<script type="text/javascript">
    let origin = location.origin;

    function cancel(){
        document.getElementById('editUser').style.display = "none";
        document.getElementById('Users').style.display = "block";
    }
    $(document).on('click', '#Delete_user', function () {
        var userId = $(this).val();
        var xhttp = new XMLHttpRequest();
        xhttp.open("DELETE", origin + "/api/user/" + userId, true);
        xhttp.send();
        setTimeout(function(){
            window.location.reload();
        }, 700);
    });
    $(document).on('click', '#buttonEdit', function (event) {
        var UsId = $(this).val();
        document.getElementById('editusername').setAttribute('placeholder',document.getElementById('auteur'+UsId).textContent)
        document.getElementById('editrole').setAttribute('placeholder',document.getElementById('role'+UsId).textContent)
        document.getElementById('editpassword').setAttribute('placeholder',document.getElementById('password'+UsId).textContent)
        document.getElementById('editId').value = UsId
        document.getElementById('editUser').style.display = "block";
        document.getElementById('Users').style.display = "none";


    });
    function addUser() {

        const data = {
            username: document.getElementById('username').value,
            role : document.getElementById('role').value,
            password : CryptoJS.AES.encrypt(document.getElementById("password").value, "My Secret Passphrase"),
        };
        var url = origin+"/api/users";
        var xhr = new XMLHttpRequest();
        const searchParams = new URLSearchParams(data);
        xhr.open("POST", url, true);
        xhr.send(searchParams);
        setTimeout(function(){
            window.location.reload();
        }, 500);
    }


    function patchUs(){
        var UsId = document.getElementById('editId').value;
        var usernameV= document.getElementById('editusername').value;
        var passwordV = document.getElementById('editpassword').value;
        var roleV = document.getElementById('editrole').value;
        const data = {
            id: UsId,
            username :usernameV,
            password: passwordV,
            role : roleV,
        };

        if(usernameV == '' || passwordV == '' || roleV == '')
        {
            var url = origin+"/api/user";
            var xhr = new XMLHttpRequest();
            const searchParams = new URLSearchParams(data);

            xhr.open("PATCH", url, true);
            xhr.send(searchParams);
            setTimeout(function(){
                window.location.reload();
            }, 650);

        }
        else {
            var url = origin+"/api/user";
            var xhr = new XMLHttpRequest();
            const searchParams = new URLSearchParams(data);

            xhr.open("PUT", url, true);
            xhr.send(searchParams);
            setTimeout(function(){
                window.location.reload();
            }, 650);

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