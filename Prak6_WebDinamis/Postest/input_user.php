<?php

session_start();
if($_POST["captcha_code"] == $_SESSION["captcha_code"]){
    include "koneksi.php";
    $id_user = $_POST['id_user'];
    $nama = $_POST['nama'];
    $email = $_POST['email'];
    $pass = md5($_POST['password']); 
    $pass2 = md5($_POST['konfirmasi_pass']); 

    if($pass==$pass2){ 
        $sql = "INSERT INTO user(id_user,password,konfirmasi_pass,nama, email) VALUES ('$id_user', '$pass', '$pass2', '$nama','$email')";
        $query=mysqli_query($con, $sql);
        mysqli_close($con); 
        header('location:tampil_user.php'); 
    }else{ 
        echo "<center> Maaf password anda tidak sama, silahkan coba lagi <br>";
        echo "<a href=form_user.php><b>Ulangi Lagi</b></a></center>";
    }

    
}
else {
    echo "<center> Captcha tidak sesuai <br>";
    echo "<a href=form_user.php><b>Ulangi Lagi</b></a></center>";
}

?>