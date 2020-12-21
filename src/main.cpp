#include <iostream>
#include <memory>

class WIDGET
{
public:
    WIDGET(const std::string &something): something(something)
    {
    }

    void printSomething()
    {
        std::cout << something << std::endl;
    }

private:
    std::string something;
};

WIDGET *justReturn(WIDGET *widget)
{
    return widget;
}

void testRaw()
{
    auto w = justReturn(new WIDGET("raw"));
    w->printSomething();
    delete w;
}

void testSmartMakeShared()
{
    auto w = std::make_shared<WIDGET>("make_shared");
    w->printSomething();
}

void testSmartSharedPtr()
{
    auto w = std::shared_ptr<WIDGET>(new WIDGET("shared_ptr"));
    w->printSomething();
}

void testSmartUniquePtr()
{
    auto w = std::unique_ptr<WIDGET>(new WIDGET("unique_ptr"));
    w->printSomething();
}

int main()
{
    testRaw();
    testSmartMakeShared();
    testSmartSharedPtr();
    testSmartUniquePtr();
    return 0;
}