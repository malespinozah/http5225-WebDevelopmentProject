<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Week 3</title>
</head>
<body>
    <?php
    /* $hour = date('H');
    if ($hour < 12) {
        echo 'good morning';
    }
    else {
        echo 'good evening';
    } */

    /*$hour = rand(1,24);
    echo $hour;*/

    /* -------- */

    /*$hour = rand(1,24);
    echo $hour; 
    if ($hour = 24 && $hour < 12) {
        echo 'good morning';
    }
    elseif ($hour > 12 && $hour < 19){
        echo 'good evening';
    }
    else {
        echo 'good night';
    }*/
    
    $number = rand(1,100);
    echo $number;
    if ($number % 3 == 0 && $number % 5 == 0) {
        echo ' FizzBuzz';
    }
    elseif ($number % 3 == 0) {
        echo ' Fizz';
    }
    elseif($number % 5 == 0){
        echo ' Buzz';
    }
    else {
        return $number;
    }
    ?>
</body>
</html>