module gl;

import math;

extern fn void glBegin (uint mode)						@cname ("glBegin");
extern fn void glEnd ()									@cname ("glEnd");
extern fn void glColor3f (float r, float g, float b)	@cname ("glColor3f");
extern fn void glVertex2f (float x, float y)			@cname ("glVertex2f");
extern fn void glPointSize (float size)					@cname ("glPointSize");

const uint POINTS				= 0x0000;


extern fn void glViewport (int x, int y, int width, int height)	@cname ("glViewport");


extern fn void glClearColor (float red, float green, float blue, float alpha)	@cname ("glClearColor");
extern fn void glClear (uint mask)												@cname ("glClear");

const uint GL_COLOR_BUFFER_BIT	= 0x00004000;


fn void resize_viewport (math::Vec2 size)
{
	glViewport (0, 0, (int)size.x, (int)size.y);
}

fn void clear (math::Vec4 color)
{
	glClearColor (color.r, color.g, color.b, color.a);
	glClear (GL_COLOR_BUFFER_BIT);
}

fn void set_pixel (math::Vec2 position, math::Vec3 color, float size)
{
	glPointSize (size);

	glBegin (POINTS);
	glColor3f (color.r, color.g, color.b);
	glVertex2f (position.x, position.y);
	glEnd ();
}