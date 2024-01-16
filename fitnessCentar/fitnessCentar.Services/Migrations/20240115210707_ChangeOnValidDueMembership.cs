using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace fitnessCentar.Services.Migrations
{
    /// <inheritdoc />
    public partial class ChangeOnValidDueMembership : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Trajanje",
                table: "Clanarinas");

            migrationBuilder.AddColumn<int>(
                name: "Trajanje",
                table: "TipClanarines",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<DateTime>(
                name: "VaziDo",
                table: "Clanarinas",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Trajanje",
                table: "TipClanarines");

            migrationBuilder.DropColumn(
                name: "VaziDo",
                table: "Clanarinas");

            migrationBuilder.AddColumn<int>(
                name: "Trajanje",
                table: "Clanarinas",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
