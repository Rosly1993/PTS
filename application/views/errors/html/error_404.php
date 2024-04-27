<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>404 Page Not Found</title>
<style type="text/css">
/*======================
    404 page
=======================*/

.page_404 {
    padding:40px 0; 
    background:#fff; 
    font-family: 'Arvo', serif;
}

.four_zero_four_bg {
    background-image: url(https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif);
    height: 400px; /* Set the height according to your image's natural size if necessary */
    background-position: center;
    background-repeat: no-repeat; /* This will ensure the image doesn't repeat */
}

.four_zero_four_bg h1 {
    font-size:80px;
}

.contant_box_404 {
    margin-top:-50px;
}

.link_404 {             
    color: #fff!important;
    padding: 10px 20px;
    background: #39ac31;
    margin: 20px 0;
    display: inline-block;
}
</style>
</head>
<body>
<section class="page_404">
    <div class="container">
        <div class="row">  
        <div class="col-sm-12 ">
        <div class="col-sm-10 col-sm-offset-1 text-center">
        <div class="four_zero_four_bg">
           <center> <h1 class="text-center ">404</h1>
		   </center>        </div>
        
       <center> <div class="contant_box_404">
        <h3 class="h2">
        Look like you're lost
        </h3>
        
        <p>The page you are looking for is not available!</p>
        
        <a href="http://10.216.128.114/PartsTraceabilitySystem/index.php/home" class="link_404">Go to Home</a>
        </div></center>
        </div>
        </div>
        </div>
    </div>
</section>
</body>
</html>
