using Gridstack.Models;
using Gridstack.Services;
using Microsoft.EntityFrameworkCore;
using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);

// Leer cadena de conexión
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

// DbContext
builder.Services.AddDbContext<GridstackContext>(options =>
    options.UseSqlServer(connectionString));

// Servicios
builder.Services.AddScoped<ProductoService>();
builder.Services.AddScoped<DetalleVentumService>();
builder.Services.AddScoped<VentaService>();

// Agregar CORS
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAngularApp",
        policy => policy
            .WithOrigins("*") // <-- Cambia esto si tu Angular está en otro puerto o dominio
            .AllowAnyHeader()
            .AllowAnyMethod()
    );
});

// Controladores y Swagger
builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        options.JsonSerializerOptions.ReferenceHandler = System.Text.Json.Serialization.ReferenceHandler.IgnoreCycles;
        options.JsonSerializerOptions.DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull;
    });


builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo
    {
        Title = "Gridstack API",
        Version = "v1",
        Description = "API para ventas de productos electrónicos"
    });
});

var app = builder.Build();

// Middleware
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "Gridstack API v1");
        c.RoutePrefix = "swagger"; // Esto permite acceder a http://localhost:{puerto}/swagger
    });
}

// Usar CORS
app.UseCors("AllowAngularApp");

app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();

app.Run();

