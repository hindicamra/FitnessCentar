using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace fitnessCentar.Services.Migrations
{
    /// <inheritdoc />
    public partial class fixesonplanishrane : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Opis",
                table: "PlanIshraneKorisniks");

            migrationBuilder.AddColumn<string>(
                name: "Opis",
                table: "PlanIshranes",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Opis",
                table: "PlanIshranes");

            migrationBuilder.AddColumn<string>(
                name: "Opis",
                table: "PlanIshraneKorisniks",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}
