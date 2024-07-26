
class Totalprice{



    int totalBill(var arr){
      int totalPrice=0;
      for(int i =0 ;i < arr.length; i++) {
        totalPrice=totalPrice + arr[i] as int;
      }
      return totalPrice;
    }

}