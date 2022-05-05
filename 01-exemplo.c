// compile:
// g++ -std=c++11 01-exemplo.c -lpthread -o 01-exemplo
//
#include <iostream>
#include <string>
#include <thread>
#include <chrono>

void thread_fn() {
  std::this_thread::sleep_for (std::chrono::seconds(1));
  std::cout << "Inside thread function\n";
}

/*
Running it on a Linux system, the message from the thread_fn is
never printed. The OS indeed cleans up thread_fn() as soon as
main() exits. Replacing t1.detach() with t1.join() always prints
the message as expected. */
int main()
{
    std::thread t1(thread_fn);
    t1.detach();

    return 0;
}
