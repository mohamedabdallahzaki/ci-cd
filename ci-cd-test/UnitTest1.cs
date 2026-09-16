using ci_cd.Controllers;
using Microsoft.AspNetCore.Mvc;
using Xunit;

namespace ci_cd_test
{
    public class UnitTest1
    {
        
        public class TestControllerTests
        {
            [Fact]
            public void GetTest_ReturnsHelloWorld()
            {
                // Arrange
                var controller = new TestController();

                // Act
                var result = controller.GetTest();

                // Assert
                var okResult = Assert.IsType<OkObjectResult>(result);
                Assert.Equal("Hello world", okResult.Value);
            }
        }
    }
}
