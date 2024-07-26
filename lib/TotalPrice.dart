
class Totalprice{



    int totalBill(var vegArr,var cost,var fruitArr,var fruitCost){
      int totalPrice=0;
      for(int i =0 ;i < vegArr.length; i++) {
        if (vegArr[i] == true) {
          totalPrice = (totalPrice + cost[i]) as int ;
        }
      }


      for(int i =0 ;i < fruitArr.length; i++) {
        if (fruitArr[i] == true) {
          totalPrice = (totalPrice + fruitCost[i]) as int ;
        }
      }
      return totalPrice;
    }

}