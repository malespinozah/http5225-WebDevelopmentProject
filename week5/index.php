<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mySQL</title>
</head>
<body>
    <?php
    $connect = mysqli_connect('localhost', 'root', 'root', 'HTTP5225Week5');

    if(!$connect) {
        echo 'Error code: ' . mysqli_connect_errno();
        echo 'Error code: ' . mysqli_connect_error();
        exit;
    }

    $query = 'SELECT `Name`, `Hex` FROM colors';
    $result = mysqli_query($connect, $query);

    if(!$result){
        echo 'Error Message ' . mysqli_error($connect); // go to connection and see what's the last error you had in the msql
        exit;
    } else {
        echo 'The query found ' . mysqli_num_rows($result);
        foreach($result as $result){
            echo
                '<div style="height:90px;
                width:100%;
                background: ' . $result['Hex'] .';
                display: flex;
                flex-direction: row;
                justify-content: center;
                align-items: center;">' . $result['Name'] . '</div>';
        }
    };
    // echo $name
    // echo '<div style="height:10px; width:100px; background: ' . $ .';"></div>'
    ?>
</body>
</html>