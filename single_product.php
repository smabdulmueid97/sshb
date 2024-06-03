<?php
session_start();
include_once("admin/class/adminback.php");
$obj = new adminback();

$cata_info = $obj->p_display_catagory();
$cataDatas = array();
while ($data = mysqli_fetch_assoc($cata_info)) {
    $cataDatas[] = $data;
}

if (isset($_GET['status'])) {
    $pdtId = $_GET['id'];
    if ($_GET['status'] == 'singleproduct') {
        $pdt_info = $obj->display_product_byId($pdtId);
        $pdt_fetch = mysqli_fetch_assoc($pdt_info);
        $pro_datas = array();
        $pro_datas[] = $pdt_fetch;
    }
}
$ctg_id = $pdt_fetch['ctg_id'];
$rel_pro = $obj->related_product($ctg_id);


if(isset($_POST['post_comment'])){
    $cmt_msg = $obj->post_comment($_POST);
}


$cmt_fetch = $obj->view_comment_id($_GET['id']);
if(isset($cmt_fetch)){
    $cmt_row = mysqli_num_rows($cmt_fetch);
}

?>




<?php
include_once("includes/head.php");
?>

<body class="biolife-body">
    <!-- Preloader -->



    <!-- HEADER -->
    <header id="header" class="header-area style-01 layout-03">

        <?php
        include_once("includes/header_top.php");
        ?>

        <?php
        include_once("includes/header_middle.php");
        ?>

        <?php
        include_once("includes/header_bottom.php");
        ?>

    </header>

    <!-- Page Contain -->
    <div class="page-contain">

        <!-- Main content -->
        <div id="main-content" class="main-content">

            <!--Hero Section-->
            <div class="hero-section hero-background">
                <h1 class="page-title">
                    <?php
                    foreach ($pro_datas as $pro_data) {
                        echo $pro_data['pdt_name'];
                    }
                    ?>
                </h1>

               
            </div>




            <!--Navigation section-->
            <div class="container">
                <nav class="biolife-nav">
                    <ul>
                        <li class="nav-item"><a href="index.php" class="permal-link">Home</a></li>

                        <li class="nav-item"><span class="current-page">

                                <?php
                                foreach ($pro_datas as $pro_data) {
                                    echo $pro_data['ctg_name'];
                                }
                                ?>
                            </span></li>

                        <li class="nav-item"><span class="current-page">

                                <?php
                                foreach ($pro_datas as $pro_data) {
                                    echo $pro_data['pdt_name'];
                                }
                                ?>
                            </span></li>
                    </ul>
                </nav>


            </div>
            <div class="container">
    <div class="page-contain single-product">
        <div class="container">

            <!-- Main content -->
            <div id="main-content" class="main-content">

                <?php
                // Remove the foreach loop
                // foreach ($pro_datas as $pro_data) {
                ?>


                <!-- summary info -->
                <form action="addtocart.php" method="POST">

                    <div class="sumary-product single-layout">
                        <div class="media">
                            <ul class="biolife-carousel slider-for" data-slick='{"arrows":false,"dots":false,"slidesMargin":30,"slidesToShow":1,"slidesToScroll":1,"fade":true,"asNavFor":".slider-nav"}'>
                                <li><img src="admin/uploads/<?php echo $pro_data['pdt_img'] ?>" alt="" width="500" height="500"></li>

                            </ul>

                        </div>
                        <div class="product-attribute">
                            <h3 class="title"><?php echo $pro_data['pdt_name'] ?></h3>
                            <div class="rating">
                                <p class="star-rating"><span class="width-80percent"></span></p>
                                <span class="review-count">(04 Reviews)</span>
                                <span class="qa-text">Q&A</span>
                                <b class="category">By: <?php echo $pro_data['ctg_name'] ?></b>
                            </div>
                            <span class="V">Stock keeping unit: <?php echo $pro_data['pdt_id'] ?></span>
                            <span class="stock" style="margin-left: 50px;">Stock: <?php echo $pro_data['product_stock'] ?> </span>

                            <p class="excerpt"><?php echo $pro_data['pdt_des'] ?></p>
                            <div class="price">
                                <ins><span class="price-amount"><span class="currencySymbol">Tk. </span><?php echo $pro_data['pdt_price'] ?></span></ins>
                            </div>

                            <div class="shipping-info">
                                <p class="shipping-day">30 min Shipping</p>
                                <p class="for-today">Pree Pickup Today</p>
                            </div>
                        </div>
                        <div class="action-form">

                            <div class="total-price-contain">
                                <span class="title">Total Price:</span>
                                <p class="price">Tk.
                                    <?php
                                    echo $pro_data['pdt_price'];
                                    ?>
                                </p>
                            </div>
                            <div class="buttons">
                                <input type="hidden" name="pdt_name" value="<?php echo $pro_data['pdt_name'] ?>">
                                <input type="hidden" name="pdt_price" value="<?php echo $pro_data['pdt_price'] ?>">
                                <input type="hidden" name="pdt_img" value="<?php echo $pro_data['pdt_img'] ?>">
                                <input type="hidden" name="pdt_id" value="<?php echo $pro_data['pdt_id'] ?>">
                                <input type="submit" value="Add To Cart" class="btn btn-block btn-success" name="addtocart">
                            </div>

                    </div>
                    </form>

                    
                </div>
            </div>
            </form>



<div class="product-tabs single-layout biolife-tab-contain">

                    <div id="tab_4th" class="tab-contain review-tab">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-5 col-md-5 col-sm-6 col-xs-12">
                                    <div class="rating-info">
                                        <p class="index"><strong class="rating">4.4</strong>out of 5</p>
                                        <div class="rating">
                                            <p class="star-rating"><span class="width-80percent"></span></p>
                                        </div>
                                        <p class="see-all">See all <?php echo $cmt_row?> reviews</p>
                                        <ul class="options">
                                            <li>
                                                <div class="detail-for">
                                                    <span class="option-name">5stars</span>
                                                    <span class="progres">
                                                        <span class="line-100percent"><span class="percent width-90percent"></span></span>
                                                    </span>
                                                    <span class="number">90</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="detail-for">
                                                    <span class="option-name">4stars</span>
                                                    <span class="progres">
                                                        <span class="line-100percent"><span class="percent width-30percent"></span></span>
                                                    </span>
                                                    <span class="number">30</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="detail-for">
                                                    <span class="option-name">3stars</span>
                                                    <span class="progres">
                                                        <span class="line-100percent"><span class="percent width-40percent"></span></span>
                                                    </span>
                                                    <span class="number">40</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="detail-for">
                                                    <span class="option-name">2stars</span>
                                                    <span class="progres">
                                                        <span class="line-100percent"><span class="percent width-20percent"></span></span>
                                                    </span>
                                                    <span class="number">20</span>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="detail-for">
                                                    <span class="option-name">1star</span>
                                                    <span class="progres">
                                                        <span class="line-100percent"><span class="percent width-10percent"></span></span>
                                                    </span>
                                                    <span class="number">10</span>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>



                                <div class="col-lg-7 col-md-7 col-sm-6 col-xs-12">
                                    <?php
                                    if (isset($_SESSION['user_id'])) {
                                    ?>

                                        <div class="review-form-wrapper">
                                            <span class="title">Submit your review</span>
                                            <form action="#" name="frm-review" method="post">
                                                <div class="comment-form-rating">

                                                <?php 
                                                    if(isset($cmt_msg)){
                                                        echo '<script>alert("Thanks for your valuable feedback")</script>';
                                                    }
                                                ?>
                                                    <label>1. Your Comment about this products:</label>




                                                </div>




                                                <p class="form-row">
                                                    <input type="hidden" value="<?php echo $_SESSION['user_id'] ?>" name="user_id">
                                                    <input type="hidden" value="<?php echo  $_SESSION['username'] ?>" name="user_name">
                                                    <input type="hidden" value="<?php echo $_GET['id'] ?>" name="pdt_id">

                                                    <textarea name="comment" id="txt-comment" cols="30" rows="10" placeholder="Write your review here..." required></textarea>
                                                </p>


                                                <p class="">
                                                    <input type="submit" name="post_comment" value="Post Comment" class="btn btn-success">
                                                </p>




                                            </form>
                                        </div>


                                    <?php } ?>
                                </div>

                               


                            </div>
                            <div id="comments">
                                <ol class="commentlist">

                                <?php 
                                
                                   
                            while($cmtinfo=mysqli_fetch_assoc($cmt_fetch)){
                                      
                                
                                ?>
                                    <li class="review">
                                        <div class="comment-container">
                                            <div class="row">
                                                <div class="comment-content col-lg-8 col-md-9 col-sm-8 col-xs-12">

                                                <p class="comment-in"><span class="post-name"></span>
                                                <span class="post-date"><?php echo $cmtinfo['comment_date'] ?></span></p>
                                                  
                                                    
                                                    <p class="author">by: <b><?php echo $cmtinfo['user_name'] ?></b></p>

                                                    <p class="comment-text"><?php echo $cmtinfo['comment'] ?>.</p>

                                                </div>
                                      
                                            </div>
                                        </div>
                                    </li>

                                    <?php     
                                }
                                ?>
                                    
                                </ol>
                                <div class="biolife-panigations-block version-2">
                                    <ul class="panigation-contain">
                                        <li><span class="current-page">1</span></li>
                                        <li><a href="#" class="link-page">2</a></li>
                                        <li><a href="#" class="link-page">3</a></li>
                                        <li><span class="sep">....</span></li>
                                        <li><a href="#" class="link-page">20</a></li>
                                        <li><a href="#" class="link-page next"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                                    </ul>
                                    <div class="result-count">
                                        <p class="txt-count"><b>1-5</b> of <b>126</b> reviews</p>
                                        <a href="#" class="link-to">See all<i class="fa fa-caret-right" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</div>





    </div>



    </div>
    </div>

    <!-- FOOTER -->

    <?php
    include_once("includes/footer.php");
    ?>

    <!--Footer For Mobile-->
    <?php
    include_once("includes/mobile_footer.php");
    ?>

    <?php
    include_once("includes/mobile_global.php")
    ?>


    <!-- Scroll Top Button -->
    <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

    <?php
    include_once("includes/script.php")
    ?>
</body>

</html>