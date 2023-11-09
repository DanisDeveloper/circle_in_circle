class Agent{
  PVector loc;
  PVector pred_loc;
  PVector speed;
  float r;
  Agent(float x,float y,float sx,float sy,float r){
    this.loc = new PVector(x,y);
    this.speed = new PVector(sx,sy);
    this.pred_loc = new PVector(0,0);
    this.r = r;
  }
}
