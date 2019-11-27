class Object {
  public CircleCollider circleCollider;

  Object(CircleCollider cCol)
  {
    circleCollider = cCol;
  }

  public void Update (float dt)
  {
    circleCollider.Update(dt);
  }
}
