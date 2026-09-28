module glfw;

struct Window
{
	void	*handel;
	uint	width;
	uint	height;
}

extern fn bool init ()		@cname ("glfwInit");
extern fn void terminate ()	@cname ("glfwTerminate");


extern fn void *glfwCreateWindow (int width, int height, char *title, void *monitor, void *refernce);
extern fn void glfwDestroyWindow (void *window);

extern fn void glfwMakeContextCurrent (void *window);

extern fn void glfwPollEvents ();
extern fn int glfwWindowShouldClose (void *window);
extern fn void glfwSwapBuffers (void *window);

fn Window create_window (String title, uint width, uint height)
{
	Window result =
	{
		.handel	= glfwCreateWindow((int)width, (int)height, title, null, null),
		.width	= width,
		.height	= height
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