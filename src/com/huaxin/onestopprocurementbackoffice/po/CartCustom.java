package com.huaxin.onestopprocurementbackoffice.po;

public class CartCustom extends Cart {
 private int cartCount;

public int getItemCount() {
	return cartCount;
}

public void setItemCount(int cartCount) {
	this.cartCount = cartCount;
}
  
}
