class CircleCollider {
  public PVector m_position, m_velocity;
  public float m_radius, m_mass;

  CircleCollider(float m, float x, float y, float r)
  {
    m_mass = m;
    m_position = new PVector(x, y);
    m_velocity = new PVector(0, 0);
    m_radius = r;
  }
  public void AddForce(PVector force)
  {
    m_velocity = m_velocity.add(force.div(m_mass));
  }

  public void Update(float dt) 
  {
    AddForce(new PVector(0,5));
    m_position.add(PVector.mult(m_velocity, dt));
    checkBoundaryCollision();
  }

  void checkBoundaryCollision() {
    if (m_position.x > width-m_radius) 
    {
      m_position.x = width-m_radius;
      m_velocity.x *= -0.8;
    } else if (m_position.x < m_radius)
    {
      m_position.x = m_radius;
      m_velocity.x *= -0.8;
    } else if (m_position.y > height-m_radius)
    {
      m_position.y = height-m_radius;
      m_velocity.y *= -0.8;
    } else if (m_position.y < m_radius) 
    {
      m_position.y = m_radius;
      m_velocity.y *= -0.8;
    }
  }  
  void checkCollision(CircleCollider other) {

    // Get distances between the balls components
    PVector distanceVect = PVector.sub(other.m_position, m_position);

    // Calculate magnitude of the vector separating the balls
    float distanceVectMag = distanceVect.mag();

    // Minimum distance before they are touching
    float minDistance = m_radius + other.m_radius;

    if (distanceVectMag < minDistance) {
      float r = m_radius + other.m_radius;
      float penetration = r - m_position.dist(other.m_position);

      PVector normal = PVector.sub(m_position, other.m_position).normalize();

      PVector relativeVelocity = PVector.sub(m_velocity, other.m_velocity);

      float velocityAlongNormal = relativeVelocity.dot(normal);

      if (velocityAlongNormal > 0) {
        return;
      }
      float e = 0.3f;

      float inverseMassA = 1 / m_mass;
      float inverseMassB = 1 / other.m_mass;

      float massSum = inverseMassA + inverseMassB;

      float j = (-(1 + e) * velocityAlongNormal) / massSum;
      
      PVector impulse = PVector.mult(normal, j );
      println(impulse);
      
      float ratio = inverseMassA / massSum;

      m_velocity.add(PVector.mult(impulse, ratio));

      ratio = inverseMassB / massSum;
      other.m_velocity.add(PVector.mult(impulse, -ratio));
    }
  }
  void display() {
    noStroke();
    fill(204);
    ellipse(m_position.x, m_position.y, m_radius*2, m_radius*2);
  }
}
