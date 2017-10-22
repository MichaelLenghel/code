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
    if (row < 0 || row >= size || col < 0 || col >= size)
    {
      return false;
    }
    else
    {
      return current[row][col];
    }//end else
  }//end isOn
  
  int countLiveCellsAround(int row, int col)
  {
    int counter = 0;
    
    //Checking 8 squares surrounding the square. 
    for(int r = (row - 1) ; r <= row + 1 ; r ++)
    {
      for (int c = (col - 1) ; c <= col + 1 ; c ++)
      {
        //Make sure that the middle square is not counted
          if(isOn(r, c) && !(r == row && c == col))
          {
            counter++;
          }//end nested if
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
        counter = countLiveCellsAround(row, col);
        
        if(current[row][col])
        {
          //1. A live cell with 2 or 3 live neighbours will continue to live
          if(counter == 2 || counter == 3)
          {
            next[row][col] = true;
          }//end if
          
          //2. Any live cell with fewer than 2 neighbours dies as if by underpopulation
          else if(counter < 2)
          {
            next[row][col] = false;
          }//end else if
          
          //3. Any live cell with more than three live neighbours dies, as if by overpopulation.
          else if(counter > 3)
          {
            next[row][col] = false;
          }  
        }//end if
        
        else
        {
           //4.Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
          if(counter == 3)
          {
           next[row][col] = true; 
          }//end if
          else
          {
            next[row][col] = false;
          }//end else
        }//end else
          
      }//end inner for  
    }//end outer for
    
    boolean[][] temp;
    temp = current;
    current = next;
    next = temp;
  }//end void update
  
  void line()
  {
    for(int i = 0; i < size; i++)
    {
        current[50][i] = true;
        
        current[50][i] = true;
        
        current[50][i] = true;
    }//end for
  }//end line
}//end class Board