﻿using System;
using System.ComponentModel.DataAnnotations;
using Xunit.Abstractions;

namespace fitnessCentar.Model.Requests
{
	public class RezervacijaUpdateRequest
	{
        [Required(ErrorMessage = "Datum je obavezno polje.")]

        public DateTime? Datum { get; set; }
    }
}

