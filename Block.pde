class Block {
  private Rectangle m_rect;
  private ArrayList<Object> objs = new ArrayList<Object>();

  Block(Rectangle rect)
  {
    m_rect = rect;
  }

  public boolean Intersect(Object obj)
  {
    if (m_rect.Intersect(obj.circleCollider.m_position))
    {
      objs.add(obj);
      return true;
    }
    return false;
  }
  public void tryCollision()
  {
    noFill();
    stroke(255,0,0);
    rect(m_rect.m_x,m_rect.m_y,m_rect.m_width, m_rect.m_height);
    
    for (int i = 0; i < objs.size(); i++)
    {
      for (int j = i+1; j< objs.size(); j++)
      {
        objs.get(i).circleCollider.checkCollision(objs.get(j).circleCollider);
      }
    }
    objs.clear();
  }
}
