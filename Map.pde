class Map {
  int rows, cols, scl;
  Square[][] squares;

  Map(int r, int c, int scl) {
    this.rows = r;
    this.cols = c;
    this.scl = scl;
    
    squares = new Square[cols][rows];
    
    for (int y = 0; y < rows ; y++) {
      for (int x = 0; x < cols; x++) {
        squares[x][y] = new Square(this.scl, 1);      
      }
    }

    for (int y = 1; y < rows - 1; y++) {
      for (int x = 1; x < cols -1; x++) {
        squares[x][y] = new Square(this.scl, int(random(0.1,1.2)));      
      }
    }
  }

  void show() {
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < cols; x++) {
        noStroke();
        if (squares[x][y].type == 1) fill (230);       
        else noFill();
        square(this.scl * x, this.scl * y, scl); 
      }
    }
  }
}
