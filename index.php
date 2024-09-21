<?php
session_start();
include "dbconnect.php";

if (isset($_GET['Message'])) {
    print '<script type="text/javascript">
               alert("' . $_GET['Message'] . '");
           </script>';
}

if (isset($_GET['response'])) {
    print '<script type="text/javascript">
               alert("' . $_GET['response'] . '");
           </script>';
}

if (isset($_POST['submit'])) {
    if ($_POST['submit'] == "login") {
        $username = $_POST['login_username'];
        $password = $_POST['login_password'];
        $query = "SELECT * from users where UserName ='$username' AND Password='$password'";
        $result = mysqli_query($con, $query) or die(mysql_error());
        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
            $_SESSION['user'] = $row['UserName'];
            print '
                <script type="text/javascript">alert("Login Berhasil!!!");</script>
                  ';
        } else {
            print '
              <script type="text/javascript">alert("Username atau Password Salah!!");</script>
                  ';
        }
    } else if ($_POST['submit'] == "register") {
        $username = $_POST['register_username'];
        $password = $_POST['register_password'];
        $query = "select * from users where UserName = '$username'";
        $result = mysqli_query($con, $query) or die(mysql_error);
        if (mysqli_num_rows($result) > 0) {
            print '
               <script type="text/javascript">alert("Username Telah Dipakai");</script>
                    ';
        } else {
            $query = "INSERT INTO users VALUES ('$username','$password')";
            $result = mysqli_query($con, $query);
            print '
                <script type="text/javascript">
                 alert("Akun Berhasil Di Daftarkan!!!");
                </script>
               ';
        }
    }
}
?>


<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Books">
    <meta name="author" content="M. A. S. A.">
    <title>UD SUMAYASA</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/my.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <style>
        .modal-header {
            background: #996B4D;
            color: #fff;
            font-weight: 800;
        }

        .modal-body {
            font-weight: 800;
        }

        .modal-body ul {
            list-style: none;
        }

        .modal .btn {
            background: #996B4D;
            color: #F3EAD1;
        }

        .modal a {
            color: #F3EAD1
        }

        .modal-backdrop {
            position: inherit !important;
        }

        #login_button,
        #register_button {
            background: none;
            color: #F3EAD1 !important;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.php" style="justify-content: center; display: flex; align-items: center;">
                    <h3 style="padding-bottom: 8px; color:#F3EAD1 !important;">UD SUMAYASA</h3>
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <?php
                    if (!isset($_SESSION['user'])) {
                        echo '
            <li>
                <button type="button" id="login_button" class="btn btn-lg" data-toggle="modal" data-target="#login">Login</button>
                  <div id="login" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title text-center">Login Form</h4>
                            </div>
                            <div class="modal-body">
                                          <form class="form" role="form" method="post" action="index.php" accept-charset="UTF-8">
                                              <div class="form-group">
                                                  <label class="sr-only" for="username">Username</label>
                                                  <input type="text" name="login_username" class="form-control" placeholder="Username" required>
                                              </div>
                                              <div class="form-group">
                                                  <label class="sr-only" for="password">Password</label>
                                                  <input type="password" name="login_password" class="form-control"  placeholder="Password" required>
                                              </div>
                                              <div class="form-group">
                                                  <button type="submit" name="submit" value="login" class="btn btn-block">
                                                      Sign in
                                                  </button>
                                              </div>
                                          </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                  </div>
            </li>
            <li>
              <button type="button" id="register_button" class="btn btn-lg" data-toggle="modal" data-target="#register">Sign Up</button>
                <div id="register" class="modal fade" role="dialog">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                              <h4 class="modal-title text-center">Member Registration Form</h4>
                          </div>
                          <div class="modal-body">
                                        <form class="form" role="form" method="post" action="index.php" accept-charset="UTF-8">
                                            <div class="form-group">
                                                <label class="sr-only" for="username">Username</label>
                                                <input type="text" name="register_username" class="form-control" placeholder="Username" required>
                                            </div>
                                            <div class="form-group">
                                                <label class="sr-only" for="password">Password</label>
                                                <input type="password" name="register_password" class="form-control"  placeholder="Password" required>
                                            </div>
                                            <div class="form-group">
                                                <button type="submit" name="submit" value="register" class="btn btn-block">
                                                    Sign Up
                                                </button>
                                            </div>
                                        </form>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                          </div>
                      </div>
                  </div>
                </div>
            </li>';
                    } else {
                        echo ' <li> <a href="#" class="btn btn-lg"> Hello ' . $_SESSION['user'] . '.</a></li>
                    <li> <a href="cart.php" class="btn btn-lg"> Cart </a> </li>; 
                    <li> <a href="destroy.php" class="btn btn-lg"> Log Out </a> </li>';
                    }
                    ?>

                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <div id="top">
        <div id="searchbox" class="container-fluid" style="width:112%;margin-left:-6%;margin-right:-6%;">
            <div>
                <form role="search" method="POST" action="Result.php">
                    <input type="text" class="form-control" name="keyword" style="width:80%;margin:20px 10% 20px 10%;" placeholder="Search for a Book , Author Or Category">
                </form>
            </div>
        </div>

        <div class="container-fluid" id="header">
            <div class="row">
                <div class="col-md-3 col-lg-3" id="category">
                    <div style="background:#996B4D; color:#F3EAD1; border:none; padding:15px;"> The Book
                        Shop
                    </div>
                    <ul>
                        <li> <a href="Product.php?value=Romance"> Romance</a> </li>
                        <li> <a href="Product.php?value=Fantasy"> Fantasy</a> </li>
                        <li> <a href="Product.php?value=Academic%20and%20Professional"> Academic & Professional </a>
                        </li>
                        <li> <a href="Product.php?value=History"> History </a></li>
                        <li> <a href="Product.php?value=Children%20and%20Teens"> Children & Teens </a> </li>
                        <li> <a href="Product.php?value=Romantic%20Comedy"> Romantic Comedy </a> </li>
                        <li> <a href="Product.php?value=Adventure"> Adventure </a> </li>
                        <li> <a href="Product.php?value=Manga%20and%20Manhwa"> Manga & Manhwa </a> </li>

                    </ul>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img class="img-responsive" src="img/carousel/blog-1.jpg">
                            </div>

                            <div class="item">
                                <img class="img-responsive" src="img/carousel/blog-2.jpg">
                            </div>

                            <div class="item">
                                <img class="img-responsive" src="img/carousel/blog-3.jpg">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-lg-3" id="offer">
                    <a href="Product.php?value=Speaking%20Books"> <img class="img-responsive center-block" src="img/offers/1.png"></a>
                    <a href="Product.php?value=Health%20and%20Cooking"> <img class="img-responsive center-block" src="img/offers/2.png"></a>
                    <a href="Product.php?value=Academic%20and%20Professional"> <img class="img-responsive center-block" src="img/offers/3.png"></a>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid text-center" id="new">
        <div class="row">
            <div class="col-sm-6 col-md-3 col-lg-3">
                <a href="description.php?ID=NEW-1&category=new">
                    <div class="book-block">
                        <div class="tag">New</div>
                        <div class="tag-side"><img src="img/tag.png"></div>
                        <img class="book block-center img-responsive" src="img/new/book-1.png">
                        <hr>
                        Black Night <br>
                        Rp 71,500 &nbsp
                        <span style="text-decoration:line-through;color:#828282;"> 110,000 </span>
                        <span class="label label-warning">35%</span>
                    </div>
                </a>
            </div>
            <div class="col-sm-6 col-md-3 col-lg-3">
                <a href="description.php?ID=NEW-2&category=new">
                    <div class="book-block">
                        <div class="tag">New</div>
                        <div class="tag-side"><img src="img/tag.png"></div>
                        <img class="block-center img-responsive" src="img/new/book-2.png">
                        <hr>
                        About The First Night 1999 <br>
                        Rp 69,000 &nbsp
                        <span style="text-decoration:line-through;color:#828282;"> 120,000 </span>
                        <span class="label label-warning">43%</span>
                    </div>
                </a>
            </div>
            <div class="col-sm-6 col-md-3 col-lg-3">
                <a href="description.php?ID=NEW-3&category=new">
                    <div class="book-block">
                        <div class="tag">New</div>
                        <div class="tag-side"><img src="img/tag.png"></div>
                        <img class="block-center img-responsive" src="img/new/book-3.png">
                        <hr>
                        Open The Sky <br>
                        Rp 120,400 &nbsp
                        <span style="text-decoration:line-through;color:#828282;"> 180,000 </span>
                        <span class="label label-warning">33%</span>
                    </div>
                </a>
            </div>
            <div class="col-sm-6 col-md-3 col-lg-3">
                <a href="description.php?ID=NEW-4&category=new">
                    <div class="book-block">
                        <div class="tag">New</div>
                        <div class="tag-side"><img src="img/tag.png"></div>
                        <img class="block-center img-responsive" src="img/new/book-4.png">
                        <hr>
                        The Big Book Of Science <br>
                        Rp 195,000 &nbsp
                        <span style="text-decoration:line-through;color:#828282;"> 300,000 </span>
                        <span class="label label-warning">35%</span>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <!-- Authors -->

    <div class="foto-author container-fluid" id="author">
        <h3 style="color:#D67B22;"> POPULAR AUTHORS </h3>
        <!-- <div class="row">
            <div class="col-sm-5 col-md-3 col-lg-3">
                <a href="Author.php?value=Stephen%20King"><img class="img-responsive center-block" src="img/popular-author/0.jpg"></a>
            </div>
            <div class="col-sm-6 col-md-3 col-lg-3">
                <a href="Author.php?value=Chetan%20Bhagat"><img class="img-responsive center-block" src="img/popular-author/1.jpg"></a>
            </div>
            <div class="col-sm-6 col-md-3 col-lg-3">
                <a href="Author.php?value=Dan%20Brown"><img class="img-responsive center-block" src="img/popular-author/2.jpg"></a>
            </div>
            <div class="col-sm-6 col-md-3 col-lg-3">
                <a href="Author.php?value=Ravinder%20Singh"><img class="img-responsive center-block" src="img/popular-author/3.jpg"></a>
            </div>
        </div> -->
        <div class="row">
            <div class="col-sm-5 col-md-3 col-lg-3">
                <a href="Author.php?value=Stephen%20King"><img class="author-picture img-responsive center-block" src="img/popular-author/1.jpg"></a>
                <h3 style="text-align: center;">Stephen King</h3>
            </div>
            <div class="col-sm-6 col-md-3 col-lg-3">
                <a href="Author.php?value=Rick%20Riordan"><img class="author-picture img-responsive center-block" src="img/popular-author/2.jpg"><a>
                        <h3 style="text-align: center;">Rick Riordan</h3>
            </div>
            <div class="col-sm-6 col-md-3 col-lg-3">
                <a href="Author.php?value=J%20K%20Rowling"><img class="author-picture img-responsive center-block" src="img/popular-author/3.jpg"></a>
                <h3 style="text-align: center;">J. K. Rowling</h3>
            </div>
            <div class="col-sm-6 col-md-3 col-lg-3">
                <a href="Author.php?value=J%20R%20R%20Tolkien"><img class="author-picture img-responsive center-block" src="img/popular-author/4.jpg"></a>
                <h3 style="text-align: center;">J. R. R. Tolkien</h3>
            </div>
        </div>
    </div>

    <footer style="margin-left:-6%;margin-right:-6%;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-1 col-md-1 col-lg-1">
                </div>
                <div class="col-sm-7 col-md-5 col-lg-5">
                    <div class="row text-center">
                        <h2>UD SUMAYASA</h2>
                        <hr class="primary">
                    </div>
                    <div class="row">
                        <div class="col-md-6 text-center">
                            <span class="glyphicon glyphicon-earphone"></span>
                            <p style="padding-bottom: 10px;">123-456-6789</p>
                        </div>
                        <div class="col-md-6 text-center">
                            <span class="glyphicon glyphicon-envelope"></span>
                            <p style="padding-bottom: 10px;">UD_Sumayasa@gmail.com</p>
                        </div>
                    </div>
                </div>
                <div class="hidden-sm-down col-md-2 col-lg-2">
                </div>
                <div class="col-sm-4 col-md-3 col-lg-3 text-center">
                    <h2 style="color:#F3EAD1; padding-top: 35px;">Follow Us At</h2>
                    <div>
                        <a href="https://twitter.com/Shin2Azure">
                            <img title="Twitter" alt="Twitter" src="img/social/twitter.png" width="35" height="35" />
                        </a>
                        <a href="https://www.linkedin.com/in/afif-ramadhani-yafarayhan/">
                            <img title="LinkedIn" alt="LinkedIn" src="img/social/linkedin.png" width="35" height="35" />
                        </a>
                        <a href="https://www.facebook.com/afif.yafarayhan/">
                            <img title="Facebook" alt="Facebook" src="img/social/facebook.png" width="35" height="35" />
                        </a>
                        <a href="https://github.com/UKnow11">
                            <img title="GitHub" alt="GitHub" src="img/social/github-mark-white.png" width="35" height="35" />
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>

</html>