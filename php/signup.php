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
       $fullname=$_POST["fullname"];
       $email=$_POST["email"];
       $password=$_POST["password"];
       $confirmpassword=$_POST["confirmpassword"];
   
       $s="SELECT *from register where Username='$fullname' && Emailid='$email'";
       $result=mysqli_query($conn,$s);
          $num=mysqli_num_rows($result);
          
       if($num==1 || $password!=$confirmpassword)
       {
          echo "<script> alert('Username already exist or password does not match ')</script>";
          
       }
       else 
       {
        
        $sql_query="INSERT INTO register(Username,Emailid,pass,confirmpassword) values('$fullname','$email','$password','$confirmpassword')";
          mysqli_query($conn,$sql_query);
          
            header("Location: ../html/signup.html");
       }
      
      mysqli_close($conn);
   }
?>