using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace fitnessCentar.Services.Migrations
{
    /// <inheritdoc />
    public partial class PrepravkaClanarine : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Naziv",
                table: "Clanarinas");

            migrationBuilder.DropColumn(
                name: "Opis",
                table: "Clanarinas");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Naziv",
                table: "Clanarinas",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Opis",
                table: "Clanarinas",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
