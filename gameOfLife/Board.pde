class Board
{
  boolean[][] current;
  boolean[][] next;
  
  int size;
  float cellSize;
  
  //Initialise size of columns as well as initial life of blocks
  Board(int size)
  {
    this.size = size;
    current = new boolean[size][size];
    next = new boolean[size][size];
    cellSize = width / (float) size;
    randomise();
  }//end Board
  
  //Sets life of values
  void render()
  {
    for(int row = 0 ; row < size ; row ++)
    {
      for (int col = 0 ; col < size ; col ++)
      {
        //If true for row and column
        if (current[row][col])
        {
          fill(0, 255, 0);
        }
        else
        {
          fill(0);
        }
        float x = map(col, 0, size, 0, width);
        float y = map(row, 0, size, 0, height);
        rect(x, y, cellSize - 1, cellSize - 1);
      }
    }
  }//end render
  
  //Sets random life values to the cells represented by rows and collumns
  void randomise()
  {
    for(int row = 0 ; row < size ; row ++)
    {
      for (int col = 0 ; col < size ; col ++)
      {
        int dice = (int) random(0, 2);
        /*if (dice == 1)
        {
          current[row][col] = true;
        }
        */
        current[row][col] = (dice == 1);
      }
    }
  }//end randomise
  
  // Methods for you guys to implement! 
  // Return true if the cell at row and col is true
  // Do bounds checking in this method to make sure row and col
  // Have valid ranges
  boolean isOn(int row, int col)
  {
    if(row == 1 && col == 1 && row <= size && col <= size)
    {
      return(true);
    }//end if
    
    else
    {
      return false;
    }//end else
    
  }//end isOn
  
  int countLiveCellsAround(int row1, int col1)
  {
    int counter, row, col;
    counter = 0;
    //Checking 8 squares surrounding the square. 
    for(row = (row1 - 1) ; row < row1 + 3 ; row ++)
    {
      for (col = (col1 - 1) ; col < col1 + 3 ; col ++)
      {
        //Make sure that the middle square is not counted
        if(row != row1 && col != col1)
        {
          if(isOn(row, col))
          {
            counter++;
          }//end nested if
        }//end outer if

      }//end inner for
    }//end outer for
    return counter;
  }//end countLiveCellsAround
  
  // This method should apply the rules to each cell
  // Dont forget to use the current board to do the calculations
  // but update the next board
  // Then swap them
  // Also dont forget to call this method from draw() in the main sketch
  void update()
  {
    int counter = 0;
    
    
    /*The actual rules for life as we know it*/
    for(int row = 0 ; row < size ; row ++)
    {
      for (int col = 0 ; col < size ; col ++)
      {
        //1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
        if(counter < 2 && (current[row][col]))
        {
          fill(0);
        }//end if
        
        //2. Any live cell with two or three live neighbours lives on to the next generation. 
        else if(counter == 2 || counter == 3 && (current[row][col]))
        {
          //Color change not needed but done any way for uniformity of the rules
          fill(0, 255, 0);
        }//end else if
        
        //3. Any live cell with more than three live neighbours dies, as if by overpopulation.
        else if(counter > 3 && (current[row][col]))
        {
          fill(0, 255, 0);
        }
        
        //Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
        else if(counter == 3 && !(current[row][col]))
        {
         fill(0, 255, 0); 
        }//end else if   
      }//end inner for  
    }//end outer for
  }//end void update
}//end class Board