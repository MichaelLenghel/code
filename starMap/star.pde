class Star
{
  boolean hab;
  String displayName;
  float distance;
  float xg, yg, zg;
  float absMag;
  
  Star(TableRow row)
  {
    displayName = row.getString("Display Name");
    distance = row.getFloat("Display Name");
    hab = (row.getInt("Hab?") == 1);
    absMag = row.getFloat("AbsMag");
    xg = row.getFloat("Xg");
    yg = row.getFloat("Yg");
    zg = row.getFloat("Zg");
  }
  
  //Create toString method to allow us to print the variables and not their addresses
  String toString()
  {
    return displayName
      + "," + distance
      + "," + absMag
      + "," + hab
      + "," + xg
      + "," + yg
      + "," + zg;
      
  }//end toString();
}//end star