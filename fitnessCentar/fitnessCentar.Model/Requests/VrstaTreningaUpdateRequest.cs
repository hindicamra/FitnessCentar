﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace fitnessCentar.Model.Requests
{
    public class VrstaTreningaUpdateRequest
    {
        public string Naziv { get; set; } = null!;

        public string? Opis { get; set; }
    }
}