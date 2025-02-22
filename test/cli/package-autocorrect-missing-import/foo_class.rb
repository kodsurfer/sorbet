# typed: strict

module Foo
  # This package is missing `import Foo::Bar::OtherPackage`
  module MyPackage
    class FooClass
      Foo::Bar::OtherPackage::OtherClass # resolves via root
      Bar::OtherPackage::OtherClass # resolves via `module Foo`
      Foo::Bar::AppPackage::OtherClass # resolves via root
      Bar::AppPackage::OtherClass # resolves via `module Foo`
    end
  end
end

module Foo::MyPackage
  Foo::Bar::OtherPackage::OtherClass # resolves via root
  Foo::Bar::MyClass::SUBCLASSES # resolves via root

  Test::Foo::Bar::OtherPackage::TestUtil

  Foo::Bar::AppPackage::OtherClass # resolves via root

  Test::Foo::Bar::AppPackage::TestUtil
end
