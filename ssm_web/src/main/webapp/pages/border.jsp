<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <!-- 导航侧栏 -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${pageContext.request.contextPath}/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>张猿猿</p>
                    <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                </div>
            </div>

            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="header">菜单</li>
                <li id="admin-index"><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

                <!-- 菜单 -->
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-book"></i> <span>权限管理</span>
                        <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="admin-login">
                            <a href="all-admin-login.html">
                                <i class="fa fa-circle-o"></i> 登录
                            </a>
                        </li>
                        <li id="admin-register">
                            <a href="all-admin-register.html">
                                <i class="fa fa-circle-o"></i> 注册
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-cube"></i> <span>基础管理</span>
                        <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="order-manage">
                            <a href="${pageContext.request.contextPath}/product/findAll.do">
                                <i class="fa fa-circle-o"></i> 产品管理
                            </a>
                        </li>
                        <li id="order-cancel">
                            <a href="all-order-cancel-list.html">
                                <i class="fa fa-circle-o"></i> 订单管理
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- 菜单 /-->
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    <!-- 导航侧栏 /-->
</body>
</html>
