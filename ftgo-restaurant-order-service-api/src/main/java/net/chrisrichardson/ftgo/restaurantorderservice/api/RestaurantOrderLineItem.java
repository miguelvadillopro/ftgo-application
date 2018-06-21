package net.chrisrichardson.ftgo.restaurantorderservice.api;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Embeddable;

@Embeddable
@Access(AccessType.FIELD)
public class RestaurantOrderLineItem {

  private int quantity;
  private String menuItemId;
  private String name;


  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  public String getMenuItemId() {
    return menuItemId;
  }

  public void setMenuItemId(String menuItemId) {
    this.menuItemId = menuItemId;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  private RestaurantOrderLineItem() {

  }

  public RestaurantOrderLineItem(String menuItemId, String name, int quantity) {
    this.menuItemId = menuItemId;
    this.name = name;
    this.quantity = quantity;
  }
}
