module glfw;

import math;

struct Window
{
	void		*handel;
	math::Vec2	size;
}

extern fn bool init ()		@cname ("glfwInit");
extern fn void terminate ()	@cname ("glfwTerminate");


extern fn void *glfwGetProcAddress (char *name) @cname ("glfwGetProcAddress");


extern fn void *glfwCreateWindow (int width, int height, char *title, void *monitor, void *refernce);
extern fn void glfwDestroyWindow (void *window);

extern fn void glfwMakeContextCurrent (void *window);

extern fn void glfwGetWindowSize (void *window, int *height, int *width);

extern fn void glfwPollEvents ();
extern fn int glfwWindowShouldClose (void *window);
extern fn void glfwSwapBuffers (void *window);

fn Window create_window (String title, int width, int height)
{
	Window result =
	{
		.handel	= glfwCreateWindow(width, height, title, null, null),
		.size	= (math::Vec2){.x = width, .y = height}
	};

	glfwMakeContextCurrent (result.handel);

	return result;
}

fn void Window.destroy (Window *self)
{
	glfwDestroyWindow (self.handel);
}


fn void Window.poll_events (Window *self)
{
	glfwPollEvents ();

	int width	= 0;
	int height	= 0;
	glfwGetWindowSize (self.handel, &width, &height);
	self.size.x	= (float)width;
	self.size.y	= (float)height;
}

fn bool Window.should_close (Window *self)
{
	int status = glfwWindowShouldClose(self.handel);

	return status == 1;
}

fn void Window.swap_buffers (Window *self)
{
	glfwSwapBuffers (self.handel);
}