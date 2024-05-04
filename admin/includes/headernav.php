<nav class="navbar header-navbar pcoded-header">
               <div class="navbar-wrapper">
                   <div class="navbar-logo">
                       <a class="mobile-menu" id="mobile-collapse" href="#!">
                           <i class="ti-menu"></i>
                       </a>
                       <div class="mobile-search">
                           <div class="header-search">
                               <div class="main-search morphsearch-search">
                                   <div class="input-group">
                                       <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                       <input type="text" class="form-control" placeholder="Enter Keyword">
                                       <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <a href="index.php">

                       <?php 
                        $obj=new adminback();
                        $logo_info = $obj->display_logo();

                        $logo = mysqli_fetch_assoc($logo_info);

                       ?>
                           <img class="img-fluid" src="uploads/<?php echo $logo['img']; ?>" alt="Theme-Logo" /> 
                       </a>
                       <a class="mobile-options">
                           <i class="ti-more"></i>
                       </a>
                   </div>

                   <div class="navbar-container container-fluid">
                       <ul class="nav-left">
                           <li>
                               <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                           </li>

                           <li>

                           </li>
                       </ul>
                       <ul class="nav-right">

                           
                           <li class="user-profile header-notification">
                               <a href="#!">
                                   <span> <?php echo $admin_email ?> </span>
                                   <i class="ti-angle-down"></i>
                               </a>
                               <ul class="show-notification profile-notification">
                                   
                                
                                   
                                  
                                   <li>
                                       <a href="?adminLogout=logout">
                                       <i class="ti-layout-sidebar-left"></i> Logout
                                   </a>
                                   </li>
                               </ul>
                           </li>
                       </ul>
                   </div>
               </div>
           </nav>