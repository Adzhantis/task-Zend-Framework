<?php
echo '<pre>';
    print_r($_FILES);

$temp = $_FILES['file']['tmp_name'];
$name = $_FILES['file']['name'];
$arr = explode('.', $name);

move_uploaded_file($temp, 'upload/'. md5(microtime()).'.'.array_pop($arr));

//$n = 1;
print_r ($arr);

?>
<form action="file.php" method ='post' enctype="multipart/form-data">
    <input type='file' multiple name="file[]">
    <input type='submit'>
</form>