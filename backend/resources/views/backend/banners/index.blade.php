@extends('backend.layouts.master')
@section('content')

<div class="content">
@include('backend.layouts.notification')
    <h2 class="intro-y text-lg font-medium mt-10">
        Danh sách banner
    </h2>
    <div class="grid grid-cols-12 gap-6 mt-5">
        <div class="intro-y col-span-12 flex flex-wrap sm:flex-nowrap items-center mt-2">
            <a href="{{route('banner.create')}}" class="btn btn-primary shadow-md mr-2">Thêm banner</a>
            
            <div class="hidden md:block mx-auto text-slate-500">Hiển thị trang {{$banners->currentPage()}} trong {{$banners->lastPage()}} trang</div>
            <div class="w-full sm:w-auto mt-3 sm:mt-0 sm:ml-auto md:ml-0">
                <div class="w-56 relative text-slate-500">
                    <form action="{{route('banner.search')}}" method = "get">
                        @csrf
                        <input type="text" name="datasearch" class="ipsearch form-control w-56 box pr-10" placeholder="Search...">
                        <i class="w-4 h-4 absolute my-auto inset-y-0 mr-3 right-0" data-lucide="search"></i> 
                    </form>
                </div>
            </div>
        </div>
        <!-- BEGIN: Data List -->
        <div class="intro-y col-span-12 overflow-auto lg:overflow-visible">
            <table class="table table-report -mt-2">
                <thead>
                    <tr>
                        <th class="whitespace-nowrap">TÊN</th>
                        <th class="whitespace-nowrap">MÔ TẢ</th>
                        <th class="text-center whitespace-nowrap">PHOTO</th>
                        <th class="text-center whitespace-nowrap">TRẠNG THÁI</th>
                        <th class="text-center whitespace-nowrap">VỊ TRÍ</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($banners as $item)
                    <tr class="intro-x">
                        <td>
                            <a href="" class="font-medium whitespace-nowrap">{{$item->title}}</a> 
                            <div class="text-slate-500 text-xs whitespace-nowrap mt-0.5">{{$item->condition}}</div>
                        </td>
                        <td class="text-left"><?php echo $item->description; ?></td>
                        <td class="w-40">
                            <div class="flex">
                                <div class="w-10 h-10 image-fit zoom-in">
                                    <img  class="tooltip rounded-full" 
                                        src="{{$item->photo}}"  >
                                </div>
                            </div>
                        </td>
                        <td class="text-center"> 
                            <input type="checkbox" 
                            data-toggle="switchbutton" 
                            data-onlabel="active"
                            data-offlabel="inactive"
                            {{$item->status=="active"?"checked":""}}
                            data-size="sm"
                            name="toogle"
                            value="{{$item->id}}"
                            data-style="ios">
                        </td>
                        <td class="text-center">{{$item->condition}}</td>
                        <td class="table-report__action w-56">
                            <div class="flex justify-center items-center">
                                <a href="{{route('banner.edit',$item->id)}}" class="flex items-center mr-3" href="javascript:;"> <i data-lucide="check-square" class="w-4 h-4 mr-1"></i> Edit </a>
                                <form action="{{route('banner.destroy',$item->id)}}" method = "post">
                                    @csrf
                                    @method('delete')
                                    <a class="flex items-center text-danger dltBtn" data-id="{{$item->id}}" href="javascript:;" data-tw-toggle="modal" data-tw-target="#delete-confirmation-modal"> <i data-lucide="trash-2" class="w-4 h-4 mr-1"></i> Delete </a>
                                </form>
                               
                            </div>
                        </td>
                    </tr>

                    @endforeach
                    
                </tbody>
            </table>
            
        </div>
    </div>
    <!-- END: HTML Table Data -->
        <!-- BEGIN: Pagination -->
        <div class="intro-y col-span-12 flex flex-wrap sm:flex-row sm:flex-nowrap items-center">
            <nav class="w-full sm:w-auto sm:mr-auto">
                {{$banners->links('vendor.pagination.tailwind')}}
            </nav>
           
        </div>
        <!-- END: Pagination -->
</div>
@endsection
@section('scripts')
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="{{asset('backend/assets/vendor/js/bootstrap-switch-button.min.js')}}"></script>
<script>
    $.ajaxSetup({
        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}
    });
    $('.dltBtn').click(function(e)
    {
        var form=$(this).closest('form');
        var dataID = $(this).data('id');
        e.preventDefault();
        Swal.fire({
            title: 'Bạn có chắc muốn xóa không?',
            text: "Bạn không thể lấy lại dữ liệu sau khi xóa",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Vâng, tôi muốn xóa!'
            }).then((result) => {
            if (result.isConfirmed) {
                // alert(form);
                form.submit();
                // Swal.fire(
                // 'Deleted!',
                // 'Your file has been deleted.',
                // 'success'
                // );
            }
        });
    });
</script>
<script>
    $(".ipsearch").on('keyup', function (e) {
        e.preventDefault();
        if (e.key === 'Enter' || e.keyCode === 13) {
           
            // Do something
            var data=$(this).val();
            var form=$(this).closest('form');
            if(data.length > 0)
            {
                form.submit();
            }
            else
            {
                  Swal.fire(
                    'Không tìm được!',
                    'Bạn cần nhập thông tin tìm kiếm.',
                    'error'
                );
            }
        }
    });

    $("[name='toogle']").change(function() {
        var mode = $(this).prop('checked');
        var id=$(this).val();
        $.ajax({
            url:"{{route('banner.status')}}",
            type:"post",
            data:{
                _token:'{{csrf_token()}}',
                mode:mode,
                id:id,
            },
            success:function(response){
                Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: response.msg,
                showConfirmButton: false,
                timer: 1000
                });
                console.log(response.msg);
            }
            
        });
  
});  
    
</script>
<!-- <script>

// Example usage of the Product class
const product1 = new Product("Laptop", 1000, 2);
product1.displayInfo(); // Output the product information

// Update price and quantity
product1.updatePrice(1200);
product1.updateQuantity(3);
product1.displayInfo(); 
</script> -->
@endsection