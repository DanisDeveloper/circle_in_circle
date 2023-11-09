Agent agent;

float D = 600;
PVector center;
void setup() {
  size(800, 800);
  frameRate(100);
  center = new PVector(width/2,height/2);
  agent = new Agent(width/2, height/2+200, 1,2, 2);
  
  background(0);
  fill(0);
  stroke(255);
  circle(width/2, height/2, D);
}

void draw() {
  //background(0);
  //fill(0);
  //stroke(255);
  //circle(width/2, height/2, D);
  fill(255);
  noStroke();
  circle(agent.loc.x, agent.loc.y, agent.r*2);

  agent.loc.add(agent.speed);
  
  float dist = PVector.dist(agent.loc,center);
  //println(dist);

  if (dist > D/2-agent.r) {    
    PVector n = new PVector(center.x - agent.loc.x ,center.y - agent.loc.y);
    n.normalize();

    println(agent.speed);
    agent.speed = agent.speed.sub(n.mult(PVector.dot(n,agent.speed) * 2));
    println(agent.speed);
    
    agent.pred_loc.x = agent.loc.x;
    agent.pred_loc.y = agent.loc.y;

    agent.loc.x += agent.speed.x;
    agent.loc.y += agent.speed.y;
  }
}

float radBetween2Vec(float x1, float y1, float x2, float y2) {
  float up = x1 * x2 + y1*y2;
  float abs1 = sqrt(pow(x1, 2) + pow(y1, 2));
  float abs2 = sqrt(pow(x2, 2) + pow(y2, 2));
  float down = abs1 * abs2;
  if (down == 0) return 0;
  else return acos(up / down);
}
