class Rectangle {
  float m_x, m_y, m_width, m_height;

  Rectangle(float x, float y, float w, float h) {
    m_x = x;
    m_y = y;
    m_width = w;
    m_height = h;
  }

  public boolean Intersect(PVector m_vector) {
    if (m_x > m_vector.x || m_y > m_vector.y || m_vector.x > (m_x + m_width) || m_vector.y > (m_y + m_height)) {
      return false;
    }
    return true;
  }
  public boolean Intersect(Rectangle rect) {
    return (m_x < rect.m_x + rect.m_width && m_x + m_width > rect.m_x &&
      m_y < rect.m_y + rect.m_height && m_y + m_height > rect.m_y);
  }
}
