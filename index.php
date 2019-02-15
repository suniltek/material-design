<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../CSS/bootstrap.css">
    <title>PHP Scroll Load</title>
</head>
<body>
<header class="rounded bg-dark p-3 text-warning m-3">
    <h2>PHP Load Content Dynamically On Scroll</h2>
</header>
<div class="container">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <h2 class="text-center text-light bg-danger p-2 rounded shadow-lg">Country list</h2>
            <div id="content">

            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../Script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    var start = 0;
    var limit = 5;
    var reachedMax = false;

    $(document).ready(function () {
        $(window).scroll(function () {
            if ($(window).scrollTop()+1 > $(document).height() - $(window).height()) {
                getData();
            }
        });
    });

    $(document).ready(function () {
        getData();
    });

    function getData() {
        if (reachedMax) {
            return;
        }

        $.ajax({
            url: 'loaddata.php',
            type: 'POST',
            data: {
                start: start,
                limit: limit,
                getData: 1
            },
            error: function () {
                alert('Error while fetching data');
            },
            success: function (response) {
                if (response == 'reachedMax') {
                    reachedMax = true;
                } else {
                    start += limit;
                    $('#content').append(response);
                }

            }
        });
    }
</script>
</body>
</html>
