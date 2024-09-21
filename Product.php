<?php
session_start();
if (!isset($_SESSION['user']))
    header("location: index.php?Message=Silahkan Login Untuk Melanjutkan");
?>

<!DOCTYPE html>
<html lang="en">

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
        #books {
            margin-bottom: 50px;
        }

        @media only screen and (width: 767px) {
            body {
                margin-top: 150px;
            }
        }

        #books .row {
            margin-top: 20px;
            margin-bottom: 10px;
            font-weight: 800;
        }

        @media only screen and (max-width: 760px) {
            #books .row {
                margin-top: 10px;
            }
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
                    if (isset($_SESSION['user'])) {
                        echo '
                    <li><a href="cart.php" class="btn btn-md"><span class="glyphicon glyphicon-shopping-cart">Cart</span></a></li>
                    <li><a href="destroy.php" class="btn btn-md"> <span class="glyphicon glyphicon-log-out">Log Out</span></a></li>
                         ';
                    }
                    ?>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

    <div id="top">
        <div id="searchbox" class="container-fluid" style="width:112%;margin-left:-6%;margin-right:-6%;">
            <div>
                <form role="search" action="Result.php" method="post">
                    <input type="text" name="keyword" class="form-control" placeholder="Search for a Book , Author Or Category" style="width:80%;margin:20px 10% 20px 10%;">
                </form>
            </div>
        </div>

        <?php
        include "dbconnect.php";
        if (isset($_GET['value'])) {
            $_SESSION['category'] = $_GET['value'];
        }
        $category = $_SESSION['category'];
        if (isset($_POST['sort'])) {
            if ($_POST['sort'] == "price") {
                $query = "SELECT * FROM products WHERE Category='$category' ORDER BY Price";
                $result = mysqli_query($con, $query) or die(mysqli_error($con));
        ?>
                <script type="text/javascript">
                    document.getElementById('select').Selected = $_POST['sort'];
                </script>
        <?php
            } else
        if ($_POST['sort'] == "priceh") {
                $query = "SELECT * FROM products WHERE Category='$category' ORDER BY Price DESC";
                $result = mysqli_query($con, $query) or die(mysqli_error($con));
            } else
        if ($_POST['sort'] == "discount") {
                $query = "SELECT * FROM products WHERE Category='$category' ORDER BY Discount DESC";
                $result = mysqli_query($con, $query) or die(mysqli_error($con));
            } else
        if ($_POST['sort'] == "discountl") {
                $query = "SELECT * FROM products WHERE Category='$category' ORDER BY Discount";
                $result = mysqli_query($con, $query) or die(mysqli_error($con));
            }
        } else {
            $query = "SELECT * FROM products WHERE Category='$category'";
            $result = mysqli_query($con, $query) or die(mysqli_error($con));
        }
        $i = 0;
        echo '<div class="container-fluid" id="books">
        <div class="row">
          <div class="col-xs-12 text-center" id="heading">
                 <h2 style="color:rgb(228, 55, 25);text-transform:uppercase;margin-bottom:0px;"> ' . $category . ' STORE </h2>
           </div>
        </div>      
        <div class="container fluid">
             <div class="row">
                  <div class="col-sm-5 col-sm-offset-6 col-md-5 col-md-offset-7 col-lg-4 col-lg-offset-8">
                       <form action="';
        echo $_SERVER['PHP_SELF'];
        echo '" method="post" class="pull-right">
                           <label for="sort">Sort by &nbsp: &nbsp</label>
                            <select name="sort" id="select" onchange="form.submit()">
                                <option value="default" name="default"  selected="selected">Select</option>
                                <option value="price" name="price">Low To High Price </option>
                                <option value="priceh" name="priceh">Highest To Lowest Price </option>
                                <option value="discountl" name="discountl">Low To High Discount </option>
                                <option value="discount" name="discount">Highest To Lowest Discount</option>
                            </select>
                       </form>
                  </div>
              </div>
        </div>';

        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $path = "img/books/" . $row['PID'] . ".jpg";
                $description = "description.php?ID=" . $row["PID"];
                if ($i % 4 == 0)
                    echo '<div class="row">';
                echo '
               <a href="' . $description . '">
                <div class="col-sm-6 col-md-3 col-lg-3 text-center">
                    <div class="book-block" style="border :3px solid #DEEAEE;">
                        <img class="book block-center img-responsive" src="' . $path . '">
                        <hr>
                         ' . $row["Title"] . '<br>
                        ' . $row["Price"] . '  &nbsp
                        <span style="text-decoration:line-through;color:#828282;"> ' . $row["MRP"] . ' </span>
                        <span class="label label-warning">' . $row["Discount"] . '%</span>
                    </div>
                </div>
                
               </a> ';
                $i++;
                if ($i % 4 == 0)
                    echo '</div>';
            }
        }
        echo '</div>';
        ?>



        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
</body>

</html>
<!--	
<script>
$('#my_select').change(function() {   
   // assign the value to a variable, so you can test to see if it is working
    var selectVal = $('#my_select :selected').val();
    alert(selectVal);
});
</script>

-->