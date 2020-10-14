Pyro
====

### Version 0.9

Pyro is a one-stop Swiss Army knife pipeline for genome assembly and polishing. The pipeline contains 19 different assemblers across Illumina paired-end short reads, PacBio (CLR) long reads, and Oxford Nanopore long reads, as well as hybrid assemblers which use combinations of these technologies. It also contains 11 different polishing packages across short and long reads, as well as hybrid polishers. Pyro takes raw fastq or fasta files as input, and will output candidate assemblies as well as quality metrics. Whatever your experience level with genome assembly, Pyro is able to meet it - if you don't know what assembler you'd like to use, Pyro will recommend assemblers and polishers based on simple information such as available computational resources/time investment, genome size, and coverage, and run them for you. If you're an expert, you can pass Pyro advanced parameters for your favourite assembler and it'll pass on the message.

Manuals
-------

- [Installation guide](docs/INSTALL.md)
- [Quick start/usage](docs/IMPATIENT.md)
- [FAQ](docs/FAQ.md)

Latest Updates
--------------

### Pyro v. 0.9

- Added everything.

Dependencies
------------

Everyone hates dependencies. Every new tool seems to have a weird and wacky combination of required versions of packages which don't match up with any other tool you're using. It's painful. Pyro agrees. Instead, Pyro requires only two things to run everything successfully:

- Singularity v 2.5 or newer, and
- Python 3 with Snakemake v 2.7 or newer.

Everything else is packaged up and ready to run in the Pyro singularity container.

Quick Installation
------------------

To install Pyro, you have two basic options:

1. **The GitHub route**

   If you have [git](https://git-scm.com/) installed, you can clone this repository:

   ```
   git clone --recursive https://github.com/genomeassembler/pyro.git pyro
   ```

2. **The pre-packaged route**

   Download the latest version as a `.tar.gz` [here](releases/tag/latest). Then, once you've got it where you want it:

   ```
   tar zxf pyro-v0.9.tar.gz
   ```

Basic Usage
-----------

### Oxford Nanopore long read data

> **Tip:** Pyro (currently!) doesn't have an in-built basecaller for Nanopore data, so make sure you run your raw FAST5 'squiggle' files through your basecaller of choice before proceeding.

Pyro accepts either a single FASTQ file of Nanopore data (can be gzipped), or a list of file locations, with each file location on a new line. If for example you're using a single gzipped FASTQ file of Nanopore reads named `my-nano-reads.fastq.gz`, call Pyro with:

```bash
path/to/pyro/directory/Pyro --nano my-nano-reads.fastq.gz --threads 20 --mem 100g
```

### PacBio CLR long read data

Pyro accepts either a single FASTQ file of PacBio data (can be gzipped), or a list of file locations, with each file location on a new line. If for example you're using a single gzipped FASTQ file of PacBio reads named `my-pacbio-reads.fastq.gz`, call Pyro with:

```bash
path/to/pyro/directory/Pyro --pacbio my-pacbio-reads.fastq.gz --threads 20 --mem 100g
```

### Illumina paired-end short read data

Pyro accepts either a single interleaved FASTQ file of Illumina data (can be gzipped), a pair of FASTQ files of forward and reverse reads (can be gzipped), or a list of file locations in either format, with each file location on a new line. If for example you're using a single pair of FASTQ files named `my-illumina-reads_1.fastq.gz` and `my-illumina-reads_2.fastq.gz`, call Pyro with:

```bash
path/to/pyro/directory/Pyro --i1 my-illumina-reads_1.fastq.gz --i2 my-illumina-reads_2.fastq.gz --threads 20 --mem 100g
```

Packages
--------

Pyro includes 19 different assembly packages which can be run in upwards of 30 different ways, as well as 11 different polishers across data types. Below is a list of all assembly packages available. For more details on each package and how to get Pyro to run them, see the full usage guide. A helpful citation is given below for each assembler, if you end up using that particular assembler's assembly in your work and would like an easy way to cite it.

### Assemblers

#### Oxford Nanopore

| Assembly Package                                   | Version | Citation |
| -------------------------------------------------- | ------- | -------- |
| [Canu](https://github.com/marbl/canu)              | v 2.0   |  |
| [Flye](https://github.com/fenderglass/flye)        | v 2.8   | |
| [Miniasm](https://github.com/lh3/miniasm)          | v 0.3   | |
| [NECAT](https://github.com/xiaochuanle/NECAT)      | v x     | |
| [Raven](https://github.com/lbcb-sci/raven)         | v x     | |
| [Shasta](https://github.com/chanzuckerberg/shasta) | v x     | |
| [Wtdbg2](https://github.com/ruanjue/wtdbg2)        | v x     | |

#### Pacbio (CLR)

| Assembly Package                                       | Version | Citation |
| ------------------------------------------------------ | ------- | -------- |
| [Canu](https://github.com/marbl/canu)                  | v 2.0   | |
| [FALCON](https://github.com/PacificBiosciences/FALCON) | v 2.8   | |
| [Flye](https://github.com/fenderglass/flye)            | v 2.8   | |
| [MECAT2](https://github.com/xiaochuanle/MECAT2)        | v x     | |
| [Miniasm](https://github.com/lh3/miniasm)              | v 0.3   | |
| [Raven](https://github.com/lbcb-sci/raven)             | v x     | |
| [Wtdbg2](https://github.com/ruanjue/wtdbg2)            | v x     | |

#### Illumina Paired-End

| Assembly Package                                                               | Version | Citation |
| ------------------------------------------------------------------------------ | ------- | -------- |
| [ABySS](https://github.com/bcgsc/abyss)                                        | v 2.0   | |
| [MaSuRCA](https://github.com/alekseyzimin/masurca)                             | v 2.8   | |
| [Meraculous](https://jgi.doe.gov/data-and-tools/meraculous/)                   | v 0.3   | |
| [Platanus](http://platanus.bio.titech.ac.jp/platanus-assembler/platanus-1-2-4) | v x     | |
| [Ray](https://github.com/sebhtml/ray)                                          | v x     | |
| [SOAPdenovo2](https://github.com/aquaskyline/SOAPdenovo2)                      | v x     | |
| [SPAdes](https://github.com/ablab/spades)                                      | v x     | |
| [SparseAssembler](https://github.com/yechengxi/SparseAssembler)                | v x     | |
| [w2rap](https://github.com/bioinfologics/w2rap-contigger)                      | v x     | |

How to Cite Pyro
------------

If you use Pyro in your research, we'd love it if you cited our paper:

Dean Southwood, Rahul V Rane, Siu Fai Lee, John G Oakeshott and Shoba Ranganathan, "Pyro: A Comprehensive Pipeline for Eukaryotic Genome Assembly", coming soon.

Need Help?
----------

If you run into any issues or have any questions about Pyro, your first point of call should be the [issue tracker](https://github.com/genomeassembler/pyro/issues) - this makes it easier to keep track of common or related issues. Before putting in a ticket, it's probably a good idea to check out the existing open and closed issues, as it may give you a more instantaneous answer to your question.

If you want to get in contact about something one-on-one, please contact Dean at dean.c.southwood@gmail.com. 