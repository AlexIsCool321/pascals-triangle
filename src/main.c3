module triangle;
import std::io;
import glfw;

fn int main (String[] args)
{
	if (!glfw::init())
	{
		return 1;
	}

	Window window = glfw::create_window("Pascal's Triangle", 500, 500);

	for ( ;; )
	{
		window.poll_events ();
		if (window.should_close()) { break; }

		window.swap_buffers ();
	}

	window.destroy ();

	return 0;
}