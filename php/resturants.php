<?php

   $servername="localhost";
   $username="root";
   $password="";
   $database="food delivery";
   
   // database conection
   $conn=new mysqli($servername,$username,$password,$database);
   if(!$conn)
   {
       die("Connection failed: " .mysqli_connect_error());
   }
 if(isset($_GET["save"]))
   {
       $resturantname=$_GET["resturantsname"]
       $name=$_POST["foodname"];
       $image=$_POST["IMAGES"];
       $price=$_POST["price"];
      
        $sql_query="INSERT INTO resturants where resturantname='$resturantname' && foodname='$name' && imag='$IMAGES' && price='$price'" ;
          mysqli_query($conn,$sql_query);
          
            header("Location: ../html/payment.html");
       
      
      mysqli_close($conn);
   }
?>