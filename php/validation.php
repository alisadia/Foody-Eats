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
 if(isset($_POST["save"]))
   {
       $fullname=$_POST["Username"];
       $password=$_POST["password"];
     
   
       $s="SELECT *from register where Username='$fullname' && pass='$password'";
       $result=mysqli_query($conn,$s);
          $num=mysqli_num_rows($result);
          
      if($num==1)
      {
           header("Location: ../html/services.html");
      }
        else{
            echo" <script> alert('Login not sucessfull')</script>";
        }   
        
      
      mysqli_close($conn);
   }
?>