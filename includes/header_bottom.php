<?php

$obj = new adminback();
$links = $obj->display_links();
$link = mysqli_fetch_assoc($links);

?>



<div class="header-bottom hidden-sm hidden-xs">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-4">

                <?php
                include_once("vertical_menu.php")
                ?>
            </div>
            <div class="col-lg-9 col-md-8 padding-top-2px">

                <?php
                include_once("search_bar.php")
                ?>


            </div>
        </div>
    </div>
</div>