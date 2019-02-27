@extends('layouts.app')
@section('metaTitle')
{{$metaTitle}}
@endsection
@section('metaDescription')
{{$metaDescription}}
@endsection
@section('metaKeyword')
{{$metaKeyword}}
@endsection
@section('head')
@include('layouts.includes.pages_head')
@endsection
@section('header')
@include('layouts.includes.pages_menu')
@endsection

@section('content')
<div style="background: linear-gradient(to right, #162043 , #445992);padding: 15px 0 20px; margin-bottom: 0px; margin-top: -10px;height:120px;position:relative;" id="particles-js">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="cms-heading report-store-header" style="color: #fff; font-size: 38px;">News Room</h1>
				<div class="clearfix"></div>
			</div>  
		</div> 
	</div>   
</div>  
<div class='clearfix'>&nbsp;</div>
<div class="container">
    <div class="row">					 
        <div class="col-md-12">
            <ul class="nav nav-pills rep-det-tabs report-store-tab-header" id="myTab">                            
                <li style="width: 20%;">
                    <a href="{{ url('/latest-industry-reports') }}"> Latest Publications</a>
                </li>                                
                <li style="width: 20%;">
                    <a href="{{ url('/upcoming-reports') }}"> Upcoming Publications</a>
                </li>  
                <li style="width: 20%;">
                    <a href="{{ url('/company-profiles') }}">Company Profiles</a>
                </li>                                
                <li style="width: 20%;" class="active">
                    <a href="{{ url('/press-release') }}">Press Release</a>
                </li>
            </ul>  
        </div>
    </div>
</div>
<div class="clearfix">&nbsp;</div>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div id="overlay" class="dark-overlay">
                <i class="fa fa-spinner fa-spin"></i>
            </div>
            <div class="inner-pg-heading-sec">
                <h1 class="inner-page-heading" style="margin-top:4px;"> Press Release </h1>
            </div>
            <div class="inner-pg-searchform">
                <form id="search-press">
                    <div class="input-group"> 
                        <input type="text" name="search" id="press-query" class="form-control" placeholder="Search...">
                        <div class="input-group-btn">
                            <button class="btn btn-default">Find</button> 
                        </div>
                    </div>
                </form>
            </div>
            <div class="clearfix"></div>
            <div class="inner-pg-sep"></div>
            <div class="inner-pages-wrapper">
                <div id="press-list">
                    @foreach($pressList as $press)
                    <div class="media">
                        <div class="media-left">
                            <div class="pr-date">
                            {{ substr(jdmonthname(gregoriantojd($press->prr_pub_month,13,2019),1), 0, 3) }}  {{ $press->prr_pub_year
                            }}
                            </div>
                        </div>
                        <div class="media-body">
                        <h3 class="media-heading pr-list-title"> <a href="{{ url('/press-release/'.$press->prr_url) }}">{{ $press->prr_title }}</a> </h3>
                            <p>
                                {{substr($press->prr_descrip, 0, 300).'...'}}
                            </p>
                            <div class="clearfix margin-bottom-10"></div> <a class="pr-read-more" href="{{ url('/press-release/'.$press->prr_url) }}">Read More</a>
                            <div class="clearfix margin-bottom-20">&nbsp;</div>
                        </div>
                    </div>
                    @endforeach
                </div>
                <div id="press-pagination"></div>
            </div>
            <div class="clearfix"></div>
            <div class="inner-pg-sep"></div>
        </div>
        <div class="col-md-4">
            <div class="cms-right-wrapper">
                <div class="csm-right-banner" style="padding: 5px 7px;">
                    <h4>For Media Inquiries, Please Contact</h4>
                </div>
                <div class="cms-right-content text-center">
                    <p class="cms-call-text"> <span>Abhinav Rautela</span><br> Communications Officer <br> Allied Market Research <br> Contact Toll Free: <a href="tel:++1-800-792-5285" style="color: #393030;text-decoration: none;">+1-800-792-5285</a><br><span>Drop us an email at</span> <br> <a href="mailto:mediacommunications@alliedanalytics.com" style="text-decoration: none;">mediacommunications@alliedanalytics.com</a> </p>
                </div>
            </div>
            <div class="clearfix">&nbsp;</div>
            <div class="cms-right-wrapper">
                <div class="csm-right-banner">
                    <p class="cms-new-release">Get Notification About <br>Our new Release</p>
                </div>
                <div class="cms-right-content">
                    <form name="" method="post" class="cms-noti-form" action="">
                        <div class="form-group cms-form-input clearfix"> 
                            <select name="sel_cat" id="sel_cat" class="form-control" required="">                      <option value="" selected="selected">---Select Category---</option>
                                @foreach($getCategories as $category)
                                <option value="{{ $category->cat_title }}">{{ $category->cat_title }}</option>
                                @endforeach
                            </select>                            
                        </div>
                        <div class="form-group cms-form-input clearfix"> <input type="email" name="email_id" class="form-control" placeholder="Enter Your Email id" required="">
                            <p style="margin-top: 5px;font-size: 13px;text-align:center">* No spam. It's a promise.</p>
                        </div>
                        <div class="form-group cms-form-input clearfix"> <button type="submit" name="reg_now" class="btn cms-btn-reg" value="">REGISTER NOW</button> </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@include('layouts.includes.particles_script')
<script>
     var monthNames = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov",
                "Dec"];

    $(document).ready(function(){
        $('#overlay').hide();
        pressPages();
    });

    function pressPages(){
        $.ajax({
            url: "{{ url('/press-list') }}",
            type: 'GET',
            data: {
                getData: 1
            },
            error: function () {
                alert('Error while fetching data');
            },
            success: function (response) {
               makePagination(response.current_page, response.last_page, response.from, response.to, response.total); 
            }
        });
    }
    
    function makePagination(current, last, from, to, total){
        
        var pagination = `
            <ul class="pagination pagination-sm inner-pagination">
            
        `;
        if (current != 1) {
            pagination += `
                <li>
                    <a href="javascript:void(0);" onclick="paging(${1})" class="pagi-prev">First</a>
                </li> 
            `;
        }
        if (current == 1) {
            pagination += `
                <li class="active"><a>${current}</a></li>
                <li><a href="javascript:void(0);" onclick="paging(${current+1})">${current+1}</a></li>
                <li><a>...</a></li>
            `;
        } else if (current == last){
            pagination += `
                <li><a>...</a></li>
                <li><a href="javascript:void(0);" onclick="paging(${current-1})">${current-1}</a></li>
                <li class="active"><a>${current}</a></li>
            `;
        }else{
            pagination += `
                <li><a>...</a></li>
                <li><a href="javascript:void(0);" onclick="paging(${current-1})">${current-1}</a></li>
                <li class="active"><a>${current}</a></li>
                <li><a href="javascript:void(0);" onclick="paging(${current+1})">${current+1}</a></li>
                <li><a>...</a></li>
            `;
        }
        if (current != last) {
            pagination += `
                <li>
                    <a href="javascript:void(0);" onclick="paging(${last})" class="pagi-prev">Last</a>
                </li> 
            `;
        }
        pagination += `
        </ul>
        <p style="float:right;"> Showing ${from} to ${to} of ${total}</p>
        `;
        $('#press-pagination').html(pagination);
    }

    function pageContent(response){
        $('#overlay').show();
        $('#press-list').html('');
        window.scrollTo({
                    top: 100,
                    behavior: 'smooth'
                });
        var reports = response.data;
        for (const rep of reports) {
            $('#press-list').append(`
            <div class="media">
                <div class="media-left">
                    <div class="pr-date">
                            ${ monthNames[rep.prr_pub_month-1]} ${ rep.prr_pub_year } </div>
                </div>
                <div class="media-body">
                    <h3 class="media-heading pr-list-title"> <a href="/press-release/${rep.prr_url}">${rep.prr_title}</a> </h3>
                    <p>
                        ${rep.prr_descrip.substring(0, 300)+'...'}
                    </p>
                    <div class="clearfix margin-bottom-10"></div> <a class="pr-read-more" href="/press-release/${rep.prr_url}">Read More</a>
                    <div class="clearfix margin-bottom-20">&nbsp;</div>
                </div>
            </div>
            `);
        }
        $('#press-pagination').html('');
        if(response.last_page != 1){
            makePagination(response.current_page, response.last_page, response.from, response.to, response.total);
        }
        
        setTimeout(()=>{ 
            $('#overlay').hide(); 
        }, 500);
    }

    function paging(page){
        var query = $('#press-query').val();
        if (query == '') {
            getPresslist(page);
        } else {
            searchPress(page);
        }
    }

    function getPresslist(page){
        var page_url = '/press-list?page='+page;
        $.ajax({
            url: page_url,
            type: 'GET',
            data: {
                getData: 1
            },
            error: function () {
                alert('Error while fetching data');
            },
            success: function (response) {
                pageContent(response);
            }
        });
    }

    function searchPress(page){
        var query = $('#press-query').val();
        $.ajax({
            url: '/press-search?page='+page,
            type: 'GET',
            data: {
                query: query
            },
            error: function () {
                alert('Error while fetching data');
            },
            success: function (response) {
                pageContent(response);
               console.log(response); 
            }
        });
    }
    $("#search-press").submit(function(event) {
        event.preventDefault();
        console.log('okk');
        searchPress(1)
    });
</script>
@endsection

@section('footer')
@include('layouts.includes.footer')
@endsection