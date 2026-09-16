using Microsoft.AspNetCore.Mvc;

namespace ci_cd.Controllers;

[ApiController]
[Route("[controller]")]
public class TestController : ControllerBase
{
    [HttpGet("test")]
    public IActionResult GetTest()
    {
        
        return Ok("Hello world");
    }

  
}