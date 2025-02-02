class ImportDoc {
    constructor(id, supplier_id, final_amount, discount_amount,shipcost,paid_amount, bank_id,wh_id) {
    this.id = id;
      this.supplier_id = supplier_id;
      this.final_amount = final_amount;
      this.discount_amount = discount_amount;
      this.shipcost = shipcost;
      this.paid_amount = paid_amount;
      this.bank_id = bank_id;
      this.wh_id = wh_id;
     
    }
 
}

class Pricelist{
    constructor(id,title, price,gpid){
        this.id = id;
        this.title = title;
        this.price = price;
        this.gpid = gpid;
    }
    updatePrice(newPrice) {
        this.price = newPrice;
    }
    generateHTMLLI()
    {
        var myhtml = ' <li>    ';
        myhtml += ' <div  ><labe class="form-select-label">'
        +this.title+'</label><input style="border:1px solid grey" id="gp'
        +this.gpid+'" onchange="updateGroupPrice('+this.gpid+')" class="ipprice py-1 px-2  text-right form-control"'
        +'value="'+ this.price+'"/>  </div>';
        myhtml +='</li>';
        return myhtml;
    }
    generateHTML()
    {
        var myhtml = '';
        myhtml = ' <div  class="col-span-2"><labe class="form-select-label">'
        +this.title+'</label><input style="border:1px solid grey" id="gp'
        +this.gpid+'" onchange="updateGroupPrice('+this.gpid+')" class="ipprice py-1 px-2  text-right form-control"'
        +'value="'+ this.price+'"/>  </div>';
        return myhtml;
    }
}
class Product {
    constructor(id,name, price, quantity,url,pricelist) {
        this.id = id;
      this.name = name;
      this.url = url;
      this.price = price;
      this.quantity = quantity;
      this.pricelist = pricelist;
    }
  
    // Method to get the total cost of the product
    getTotalCost() {
      return this.price * this.quantity;
    }
  
    // Method to update the price of the product
    updatePrice(newPrice) {
        if(newPrice >= 0)
            this.price = newPrice;
    }
    generateHTML()
    {
        var divprice = ' <div id="div_group_price"  >'
            +' <h2> Giá bán: </h2>'
            +' <div style="font-size:80%" class="overflow-x-auto flex grid grid-cols-12 gap-2" id="t-proid" >';
      
        this.pricelist.forEach((pp) => {
            divprice+= pp.generateHTML();
           
        });
        divprice += '</div></div>';
        var dropdown = '<div class="dropdown py-3 px-1 "> '
        +'<a style=" cursor: pointer; " aria-expanded="false" '
        + 'data-tw-toggle="dropdown"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" icon-name="chevron-down" data-lucide="chevron-down" class="lucide lucide-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg></a>'
        + '<div class="dropdown-menu w-40">'
        +    '<ul class="dropdown-content"><li>Thiết lập giá bán:</li>';
        this.pricelist.forEach((pp) => {
            dropdown+= pp. generateHTMLLI();
        });
        dropdown+=    '</ul></div> </div>';
        
   
        var btnclose='<button type="button" onclick="removeProduct('+this.id+')" class="btn-close text-red"  aria-label="Close"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" icon-name="x" data-lucide="x" class="lucide lucide-x w-4 h-4"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg> </button>';
       
        var myhtml = '<tr><td class="!py-4"><div class="flex items-center"><div class="w-10 h-10 image-fit zoom-in">'
        + '<img class="rounded-lg border-2 border-white shadow-md tooltip" src="'
        + this.url + '" ></div><a href="" class="font-medium   ml-4">'
        + this.name+'</a> </div> </td> <td class="text-right"><div class="flex"><input type="number" style="width:150px" id="ip'
        +this.id+'" onchange="updatePrice('+this.id+')" class="ipprice py-3 px-4  text-right form-control  " value="'
        + this.price+'"/> '+ dropdown+' </div></td><td class="text-right"><input type="number" style="width:100px"  id="iq'
        + this.id +'" onchange="updateQuantity('+this.id+')" class="ipqty py-3 px-4  text-right form-control " value="'
        + this.quantity+'"/></td><td class="text-right">'
        + Intl.NumberFormat().format(this.getTotalCost())+'</td><td>' + btnclose +'</td></tr>'
        // +'<tr> <td colspan="5">'+ divprice+' </td></tr>'
        
        ;
        return myhtml;
    }
    // Method to update the quantity of the product
    updateQuantity(newQuantity) {
      this.quantity = newQuantity;
    }
  
    // Method to display product information
    displayInfo() {
    console.log(`Product Id: ${this.id}`);
      console.log(`Product Name: ${this.name}`);
      console.log(`Price: $${this.price}`);
      console.log(`Quantity: ${this.quantity}`);
      console.log(`Total Cost: $${this.getTotalCost()}`);
    }
  }
  
  function updatePrice(id )
{
    ip = document.getElementById('ip'+id);
    if(ip.value < 0)
    {
        ip.value = 0;
    }
    // alert(ip.value);
    productList.forEach((product) => {
        if(product.id == id)
        {
            product.updatePrice(ip.value);
           
        }
    });
    updateListView();
}
function updateGroupPrice(id)
{
    ip = document.getElementById('gp'+id);
    if(ip.value < 0)
    {
        ip.value = 0;
    }
    productList.forEach((product) => {
        product.pricelist.forEach((pp) => {
            if(pp.gpid == id)
            {
                pp.updatePrice(ip.value);
                // alert(ip.value);
            }
        });
    });
}
function removeProduct(id)
{
    id = id * 1;
    productList = productList.filter(product => product.id - id !== 0);
    updateListView();
}
function updateQuantity(id )
{
    ip = document.getElementById('iq'+id);
    if(ip.value < 0)
    {
        ip.value = 1;
    }
    // alert(ip.value);
    productList.forEach((product) => {
        if(product.id == id)
        {
            product.updateQuantity(ip.value);
        }
    });
    updateListView();
}
function generateTableFooter()
{
    var pcount = 0;
    var qsum = 0;
    var ptotal = 0;
    productList.forEach((product) => {
        pcount ++;
        qsum += product.quantity*1;
        ptotal += product.getTotalCost();
    });
    var myhtml = "<tr> <td class='text-left'>Tổng số loại: "+pcount 
            +"</td><td class='text-right'>-</td><td class='text-right'> số lượng: "
            +qsum+"</td><td class='text-right' colspan='2'> tổng tiền: "
            + Intl.NumberFormat().format(ptotal) +"</td></tr>";
    if(tong!=null)
        tong = ptotal;
    var iptotalcost = document.getElementById('totalcost');
    var shipcost = document.getElementById('shipcost');
    var discount_amount = document.getElementById('discount_amount');
    var sptotalcost = document.getElementById('sptotalcost');

    if(iptotalcost)
     {
        iptotalcost.value = ptotal -discount_amount.value +parseInt(shipcost.value);
        sptotalcost.innerHTML = Intl.NumberFormat().format( iptotalcost.value);
        if (document.getElementById('check_paidall').checked) {
            document.getElementById('paid_amount').value = iptotalcost.value;
        }
     }   
    return myhtml;
}
function addtoProductList(newpro )
{
    var kq = true;
    productList.forEach((product) => {
        if(product.id == newpro.id)
            kq = false;
    });
    if(kq == true)
    productList.push(newpro)
    return kq;
}

function updateListView()
{
    var tbody = $('#product_list_table');
    var tfooter = $('#table_footer');
    
    var myhtml ="";
    productList.forEach((product) => {
        
        
        myhtml += product.generateHTML();
    });
    tbody.html(myhtml);
    tfooter.html(generateTableFooter());
}